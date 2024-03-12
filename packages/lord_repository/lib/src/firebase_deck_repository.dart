import 'dart:async';
import 'dart:convert';
import 'package:lord_repository/lord_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as dev;

class FirebaseDeckRepository implements DeckRepository {
  static const url =
      'https://lord-of-the-rings-card-game-default-rtdb.europe-west1.firebasedatabase.app/deck';
  FirebaseDeckRepository();

  @override
  Future<Deck> createDeck(Deck deck) async {
    try {
      final response = await http.post(Uri.parse('$url.json'),
          body: json.encode(deck.toModel().toJson()));
      final data = json.decode(response.body);
      data.forEach((key, value) {
        deck.id = value;
      });
      return deck;
    } catch (e) {
      dev.log(e.toString());
      throw Exception(e);
    }
  }

  @override
  Future<List<Deck>> getAllDecks() async {
    try {
      final response = await http.get(Uri.parse('$url.json'));
      final Map<String, dynamic> data = json.decode(response.body);
      final List<Deck> decks = [];
      data.forEach((key, value) {
        final deck = DeckModel.fromJson(value);
        decks.add(Deck(deck.id, deck.name, deck.listCardsIds));
      });
      return decks;
    } catch (e) {
      dev.log('Deck are empty');
      return [];
    }
  }

  Future<void> addCardToDeck(Deck deck) async {
    try {
      await http.patch(Uri.parse('$url/${deck.id}.json'),
          body: json.encode(deck.toModel().toJson()));
    } catch (e) {
      dev.log(e.toString());
    }
  }
}
