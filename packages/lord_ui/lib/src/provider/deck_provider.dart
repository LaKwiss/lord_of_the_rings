import 'package:lord_repository/lord_repository.dart';
import 'package:flutter/material.dart' hide Card;

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
    try {
      final deck = await _repository.createDeck(Deck.fromName(name));
      _decks.add(deck);
    } catch (e) {
      throw Exception(e);
    } finally {
      notifyListeners();
    }
  }

  Deck findByName(String name) {
    try {
      return _decks.firstWhere((element) => element.name == name);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addCardToDeck(String deckName, Card card) async {
    try {
      final deck = findByName(deckName);

      deck.listCardsIds.add(card.name!);
      _repository.addCardToDeck(deck);
    } catch (e) {
      throw Exception(e);
    } finally {
      notifyListeners();
    }
  }

  Future<void> removeCardFromDeck(int index, Deck deck) async {
    try {
      _repository.removeCardFromDeck(deck, index);
    } catch (e) {
      throw Exception(e);
    } finally {
      notifyListeners();
    }
  }

  Future<void> deleteDeck(Deck deck) async {
    try {
      await _repository.deleteDeck(deck);
      _decks.removeWhere((element) => element.id == deck.id);
    } catch (e) {
      throw Exception(e);
    } finally {
      notifyListeners();
    }
  }
}
