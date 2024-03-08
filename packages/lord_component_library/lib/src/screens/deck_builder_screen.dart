import 'package:flutter/material.dart' hide Card;
import 'package:lord_component_library/component_library.dart';
import 'package:lord_repository/lord_repository.dart';
import 'package:lord_ui/lord_ui.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as dev;

enum FilterOptions { all, hero, quest }

// ignore: must_be_immutable
class DeckBuilder extends StatefulWidget {
  DeckBuilder({super.key});

  static const routeName = '/deckBuilder';

  final Deck myDeck = Deck('1', 'My Deck', []);

  @override
  State<DeckBuilder> createState() => _DeckBuilderState();
}

class _DeckBuilderState extends State<DeckBuilder> {
  FilterOptions filterOptions = FilterOptions.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deck Builder'),
        actions: [
          for (FilterOptions option in FilterOptions.values)
            TextButton(
              onPressed: () {
                setState(() {
                  filterOptions = option;
                });
              },
              child: Text(option.toString().split('.').last),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: CardsGrid(filterOptions: filterOptions, myDeck: widget.myDeck),
      ),
    );
  }
}

class CardsGrid extends StatelessWidget {
  CardsGrid({required this.filterOptions, super.key, required this.myDeck});

  final FilterOptions filterOptions;

  final Deck myDeck;

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);
    //final deckProvider = Provider.of<DeckProvider>(context);

    final cards = filterOptions != FilterOptions.all
        ? filterOptions == FilterOptions.hero
            ? cardProvider.hero
            : cardProvider.quests
        : cardProvider.cards;

    dev.log('Cards length: ${cards.length}', name: 'CardsGrid');

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 5 / 7),
      itemCount: cards.length,
      itemBuilder: (context, index) => LotrCardItem(
        imageUrl: cards[index].imagesrc,
        name: cards[index].name,
        onSelected: () {
          if (myDeck.listCardsIds.contains(index)) {
            myDeck.listCardsIds.remove(index);
          } else {
            myDeck.listCardsIds.add(index);
          }
          dev.log(myDeck.toString());
        },
      ),
    );
  }
}
