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
          body: json.encode(DeckModel.toJson(deck.toModel())));
      final data = json.decode(response.body);

      dev.log(data.toString());

      await http.patch(Uri.parse('$url/${data['name']}.json'),
          body: json.encode({'id': data['name']}));

      return deck;
    } catch (e) {
      dev.log(e.toString());
      throw Exception(e);
    }
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

  Future<void> addCardToDeck(String deckName, Card card) async {
    try {
      final List<Deck> decks = await getAllDecks();
      dev.log('decks: $decks');
      final String deckWhereToAddCard =
          decks.where((element) => element.name == deckName) as String;

      final response = await http
          .post(Uri.parse('$url/$deckWhereToAddCard.json'), body: card.name);

      dev.log('done');
    } catch (e) {
      dev.log(e.toString());
    }
  }
}
