import 'package:lord_repository/lord_repository.dart';

abstract class CardRepository {
  Future<List<Card>> getAllCards();
  Future<Card> updateCard(Card card);
  Future<Card> deleteCard(Card card);
  Future<Card> addCard(Card card);
}
