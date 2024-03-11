import 'package:lord_repository/lord_repository.dart';
import 'package:flutter/material.dart';

class DeckProvider extends ChangeNotifier {
  DeckProvider(this._repository);
  final List<Deck> _decks = [];
  final FirebaseDeckRepository _repository;

  List<Deck> get decks => _decks;

  Future<void> fetchAndSetDecks() async {
    try {
      final List<Deck> decks = await _repository.getAllDecks();
      _decks.clear();
      _decks.addAll(decks);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> createDeck(String name) async {
    final toto = Deck('1', name, [1, 1, 1, 1, 1]);

    try {
      final deck = await _repository.createDeck(
          toto); // Still create an error : Error: Exception: TypeError: null: type 'Null' is not a subtype of type 'String'
      _decks.add(deck);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
