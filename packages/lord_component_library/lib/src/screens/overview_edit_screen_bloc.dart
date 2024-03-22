import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lord_bloc/lord_bloc.dart';
import 'package:go_router/go_router.dart';

class OverviewEditScreenBloc extends StatelessWidget {
  const OverviewEditScreenBloc({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CardsBloc>().add(FetchAndSetCards());

    return BlocBuilder<CardsBloc, CardsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Overview Edit Screen'),
          ),
          body: ListView.separated(
            itemCount: state.cards.length,
            separatorBuilder: (context, index) => SizedBox(height: 2),
            itemBuilder: (context, index) {
              final card = state.cards[index];
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
                            try {
                              context.read<CardsBloc>().findById(card.id!);
                              context
                                  .go('/editScreen', extra: {'id': card.id!});
                              log(card.name.toString());
                            } catch (e) {
                              log(e.toString());
                            }
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
                                        context
                                            .read<CardsBloc>()
                                            .add(DeleteCard(card));
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
      },
    );
  }
}
