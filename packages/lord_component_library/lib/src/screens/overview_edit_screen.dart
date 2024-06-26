import 'package:flutter/material.dart' hide Card;
import 'package:lord_bloc/lord_bloc.dart';
import 'package:provider/provider.dart';

import '../screens.dart';

class OverviewEditScreen extends StatefulWidget {
  const OverviewEditScreen({Key? key});

  static const routeName = '/overviewEdit';
  @override
  State<OverviewEditScreen> createState() => _OverviewEditScreenState();
}

class _OverviewEditScreenState extends State<OverviewEditScreen> {
  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overview Edit Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AddScreen.routeName,
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: cardProvider.cards.length,
        separatorBuilder: (context, index) => SizedBox(height: 2),
        itemBuilder: (context, index) {
          final card = cardProvider.cards[index];
          return Container(
            color: index % 2 == 0
                ? Colors.grey[200]
                : null, // Set light grey background for every other ListTile
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(card.imagesrc ?? 'no image'),
              ),
              title: Text(card.name ?? 'no name'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconTheme(
                    data: IconThemeData(color: Colors.white),
                    child: IconButton(
                      icon: Icon(Icons.edit),
                      color: Colors.green,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          EditScreen.routeName,
                          arguments: card,
                        );
                      },
                    ),
                  ),
                  IconTheme(
                    data: IconThemeData(color: Colors.white),
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Delete Card'),
                              content: Text(
                                  'Are you sure you want to delete the card "${card.name}"?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    cardProvider.deleteCard(card);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Delete'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
