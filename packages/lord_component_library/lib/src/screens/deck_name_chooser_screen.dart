import 'package:flutter/material.dart';
import 'package:lord_component_library/component_library.dart';
import 'package:provider/provider.dart';
import 'package:lord_ui/lord_ui.dart';

class DeckNameChooserScreen extends StatefulWidget {
  static const routeName = '/deckNameChooserScreen';

  @override
  State<DeckNameChooserScreen> createState() => _DeckNameChooserScreenState();
}

class _DeckNameChooserScreenState extends State<DeckNameChooserScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void didChangeDependencies() async {
    await Provider.of<DeckProvider>(context, listen: false).fetchAndSetDecks();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final deckProvider = Provider.of<DeckProvider>(context);

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
                deckProvider.createDeck(_nameController.text);
                Navigator.of(context).pushNamed(DeckBuilder.routeName);
              },
              child: Text('Create Deck'),
            ),
          ),
        ],
      ),
    );
  }
}
