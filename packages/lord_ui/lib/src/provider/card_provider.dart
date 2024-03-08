import 'package:lord_repository/lord_repository.dart';
import 'package:flutter/material.dart' hide Card;

class CardProvider extends ChangeNotifier {
  CardProvider(this._repository);
  final List<Card> _cards = [];
  final FirebaseCardRepository _repository;

  List<Card> get cards => _cards;

  List<Card> get quests => cards
      .where((element) => element.type_code == 'player-side-quest')
      .toList();

  List<Card> get hero =>
      cards.where((element) => element.type_code == 'hero').toList();

  Future<void> fetchAndSetCards() async {
    try {
      final List<Card> cards = await _repository.getAllCards();
      _cards.clear();
      _cards.addAll(cards);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Card findById(String id) {
    return _cards.firstWhere((element) => element.id == id);
  }

  Future<void> updateCard(Card card) async {
    try {
      final index = _cards.indexWhere((element) => element.id == card.id);
      final data = await _repository.updateCard(card);
      _cards[index] = data;
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteCard(Card card) async {
    try {
      await _repository.deleteCard(card);
      _cards.removeWhere((element) => element.id == card.id);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
