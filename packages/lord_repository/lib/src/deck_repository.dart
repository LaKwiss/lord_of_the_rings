import 'package:lord_repository/lord_repository.dart';

abstract class DeckRepository {
  Future<List<Deck>> getAllDecks();
  Future<void> addDeck(Deck deck, int id);
}
