import 'dart:convert';

import 'package:lord_repository/lord_repository.dart';
import 'package:lord_repository/src/models/deck_model.dart';
import 'package:http/http.dart' as http;

class FirebaseDeckRepository implements DeckRepository {
  static const url = 'http://127.0.0.1:9000/deck';
  static const dbName = '?ns=card-7d2cb';
  FirebaseDeckRepository();

  @override
  Future<List<Deck>> getAllDecks() async {
    try {
      final List<Deck> decks = [];

      final parsedUrl = Uri.parse('$url.json$dbName');
      final response = await http.get(parsedUrl);
      final statusCode = response.statusCode;
      if (statusCode != 200) {
        throw Exception(statusCode);
      }
      final jsonString = response.body;
      final data = jsonDecode(jsonString);
      for (final deck in data) {
        decks.add(Deck.fromModel(DeckModel.fromJson(deck)));
      }

      return decks;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> addDeck(Deck deck, int id) {
    //TODO: implement addDeck to database
    throw UnimplementedError();
  }
}
