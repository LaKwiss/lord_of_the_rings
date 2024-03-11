import 'package:lord_repository/lord_repository.dart';
import 'package:flutter/material.dart';

class DeckProvider extends ChangeNotifier {
  DeckProvider(this._repository);
  final List<Deck> _decks = [];
  final FirebaseDeckRepository _repository;

  List<Deck> get decks => _decks;

  Future<void> fetchAndSetCards() async {
    try {
      final List<Deck> decks = await _repository.getAllDecks();
      _decks.clear();
      _decks.addAll(decks);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
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
      final Deck deck = Deck(DateTime.now().toString(), name, const []);
      _decks.add(deck);
      notifyListeners();
    } catch (e) {
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
