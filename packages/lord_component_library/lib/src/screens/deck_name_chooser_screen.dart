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
                if (_nameController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Deck name cannot be empty'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Ok'),
                        ),
                      ],
                    ),
                  );
                } else if (_nameController.text.length > 30) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Error'),
                      content:
                          Text('Deck name cannot be longer than 30 characters'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Ok'),
                        ),
                      ],
                    ),
                  );
                } else if (_nameController.text.contains(' ')) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Deck name cannot contain spaces'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Ok'),
                        ),
                      ],
                    ),
                  );
                } else if (deckProvider.decks
                    .any((element) => element.name == _nameController.text)) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Deck name already exists'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Ok'),
                        ),
                      ],
                    ),
                  );
                } else {
                  deckProvider.createDeck(_nameController.text);
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(DeckBuilder.routeName,
                      arguments: _nameController.text);
                }
              },
              child: Text('Create Deck'),
            ),
          ),
          Positioned(
              top: 200,
              right: 250,
              child: SizedBox(
                width: 300,
                height: 300,
                child: ListView.builder(
                  itemCount: deckProvider.decks.length,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      title: GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(
                            DeckOverview.routeName,
                            arguments: deckProvider.decks[index].name),
                        child: Text(
                          deckProvider.decks[index].name,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  DeckBuilder.routeName,
                                  arguments: deckProvider.decks[index].name);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.lightGreen,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: Text('Delete Deck'),
                                        content: Text(
                                            'Are you sure you want to delete this deck?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              deckProvider.deleteDeck(
                                                  deckProvider.decks[index]);
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Yes'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('No'),
                                          ),
                                        ],
                                      ));
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ))
        ],
      ),
    );
  }
}
