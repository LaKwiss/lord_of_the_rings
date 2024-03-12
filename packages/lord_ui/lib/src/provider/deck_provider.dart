import 'package:lord_repository/lord_repository.dart';
import 'package:flutter/material.dart';

class DeckProvider extends ChangeNotifier {
  DeckProvider(this._repository);
  final List<Deck> _decks = [];
  final FirebaseDeckRepository _repository;

  List<Deck> get decks => _decks;

  Future<void> fetchAndSetDecks() async {
    try {
      _decks.clear();
      final datas = await _repository.getAllDecks();
      _decks.addAll(datas);
    } catch (e) {
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  Future<void> createDeck(String name) async {
    final toto = Deck('1', name, []);

    try {
      final deck = await _repository.createDeck(toto);

      _decks.add(deck);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addCardToDeck(String deckId, String cardId) async {
    try {
      await _repository.addCardToDeck(deckId, cardId);
      _decks
          .firstWhere((element) => element.name == deckId)
          .listCardsIds
          .add(cardId);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
