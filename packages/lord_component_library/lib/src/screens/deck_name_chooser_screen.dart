import 'package:flutter/material.dart';
import 'package:lord_component_library/component_library.dart';
import 'package:provider/provider.dart';
import 'package:lord_ui/lord_ui.dart';

class DeckNameChooserScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  static const routeName = '/deckNameChooserScreen';

  @override
  Widget build(BuildContext context) {
    final deckProvider = Provider.of<DeckProvider>(context);

    void addDeck() {
      if (deckProvider.decks.any((deck) => deck.name == _nameController.text)) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text('Deck already exists'),
                  content: Text('Please choose a different name'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Ok'),
                    ),
                  ]);
            });
      } else {
        deckProvider.addDeck(_nameController.text);
        Navigator.of(context).pop();
      }
    }

    return Scaffold(
      backgroundColor: Color(0xff2d6087),
      appBar: AppBar(
        title: Text('Lotr Card Game - Deck Creator'),
      ),
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'packages/lord_component_library/lib/src/assets/create_deck.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 100,
            child: Container(
              width: 300,
              child: TextFormField(
                controller: _nameController,
                style: TextStyle(
                  color: Colors.white, // Set the text color to white
                ),
                decoration: InputDecoration(
                  labelText: 'Deck Name',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: 100,
            child: ElevatedButton(
              onPressed: () {
                addDeck();
              },
              child: Text('Create Deck'),
            ),
          ),
        ],
      ),
    );
  }
}
