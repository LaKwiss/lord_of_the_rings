import 'package:lord_repository/lord_repository.dart';

abstract class DeckRepository {
  Future<Deck> createDeck(Deck deck);
  Future<List<Deck>> getAllDecks();
}
