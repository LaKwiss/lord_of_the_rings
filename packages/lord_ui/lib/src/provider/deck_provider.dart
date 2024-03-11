import 'package:lord_repository/lord_repository.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class DeckProvider extends ChangeNotifier {
  DeckProvider(this._repository);
  final List<Deck> _decks = [];
  final FirebaseDeckRepository _repository;

  List<Deck> get decks => _decks;

  Future<void> fetchAndSetDecks() async {
    // try {
    //   dev.log('fetchAndSetDecks');
    //   final List<Deck> decks = await _repository.getAllDecks();
    //   _decks.clear();
    //   _decks.addAll(decks);
    //   notifyListeners();
    // } catch (e) {
    //   throw Exception(e);
    // }
    dev.log('fetchAndSetDecks');
  }

  Future<void> addCardToDeck(Deck deck, int id) async {
    try {
      deck.listCardsIds.add(id);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> removeCardFromDeck(Deck deck, int id) async {
    try {
      deck.listCardsIds.remove(id);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addDeck(String name) async {
    try {
      final deckToAdd = Deck('hello', name, const [1, 2, 3]);
      final deck = await _repository.addDeck(deckToAdd);
      _decks.add(deck);
      notifyListeners();
    } catch (e) {
      dev.log(e.toString());
      throw Exception(e);
    }
  }

  Future<void> deleteDeck(Deck deck) async {
    try {
      _decks.removeWhere((element) => element.id == deck.id);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
