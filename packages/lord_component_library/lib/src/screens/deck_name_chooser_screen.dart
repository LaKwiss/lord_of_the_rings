import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lord_ui/lord_ui.dart';

class DeckNameChooserScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  static const routeName = '/deckNameChooserScreen';

  @override
  Widget build(BuildContext context) {
    final deckProvider = Provider.of<DeckProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lotr Card Game - Deck Creator'),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Enter Deck Name',
                  labelStyle: TextStyle(fontSize: 28),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  String deckName = _nameController.text;

                  // Add deck to deck provider
                  // deckProvider.addDeck(deckName);

                  if (deckProvider.decks.any((deck) => deck.name == deckName)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Name Already Exists'),
                          content: Text(
                              'The name "$deckName" already exists. Please choose a different name.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    deckProvider.addDeck(deckName);
                  }
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.lightBlue,
                    padding: EdgeInsets.all(18)),
                child: Text('Continue', style: TextStyle(fontSize: 28)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
