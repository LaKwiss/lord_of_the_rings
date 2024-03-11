import 'dart:async';
import 'dart:convert';
import 'package:lord_repository/lord_repository.dart';
import 'package:http/http.dart' as http;

class FirebaseDeckRepository implements DeckRepository {
  static const url =
      'https://lord-of-the-rings-card-game-default-rtdb.europe-west1.firebasedatabase.app/deck';
  FirebaseDeckRepository();

  @override
  Future<Deck> createDeck(Deck deck) async {
    final response = await http.post(
      Uri.parse('$url.json'),
      body: json.encode(DeckModel.toJson(deck.toModel())),
    );
    return Deck.fromModel(DeckModel.fromJson(json.decode(response.body)));
  }

  @override
  Future<List<Deck>> getAllDecks() async {
    final response = await http.get(Uri.parse('$url.json'));
    final Map<String, dynamic> data = json.decode(response.body);
    final List<Deck> decks = [];
    data.forEach((key, value) {
      final deck = DeckModel.fromJson(value);
      decks.add(Deck(deck.id, deck.name, deck.listCardsIds));
    });
    return decks;
  }
}
