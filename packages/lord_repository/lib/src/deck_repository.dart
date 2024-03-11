import 'package:lord_repository/lord_repository.dart';

abstract class DeckRepository {
  Future<List<Deck>> getAllDecks();
  Future<Deck> deleteDeck(Deck deck);
  Future<Deck> updateDeck(Deck deck);
  Future<Deck> addDeck(Deck deck);
}
