import 'dart:async';
import 'dart:convert';
import 'package:lord_repository/lord_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as dev;

class FirebaseCardRepository implements CardRepository {
  static const url =
      'https://lord-of-the-rings-card-game-default-rtdb.europe-west1.firebasedatabase.app/card';
  //static const dbName = '?ns=card-7d2cb';
  FirebaseCardRepository({this.client});

  final http.Client? client;

  @override
  Future<List<Card>> getAllCards() async {
    try {
      final List<Card> cards = [];

      final parsedUrl = Uri.parse('$url.json');
      final response = await http.get(parsedUrl);
      final statusCode = response.statusCode;
      if (statusCode != 200) {
        throw Exception(statusCode);
      }

      final jsonString = response.body;
      final data = jsonDecode(jsonString);

      if (data != null) {
        data.forEach(
          (cardId, cardData) {
            dev.log(cardId);
            dev.log(cardData.toString());
            cards.add(
              Card.fromModel(
                CardModel.fromJson(cardData).copyWith(id: cardId),
              ),
            );
            dev.log(cardId.toString());
          },
        );
      }

      dev.log(cards.length.toString());
      return cards;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Card> updateCard(Card card) async {
    final completer = Completer<Card>();

    try {
      Card updatedCard;

      final httpClient = client ?? http.Client();

      final parsedUrl = Uri.parse('$url/${card.id}.json');

      final response = await httpClient.patch(parsedUrl,
          body: jsonEncode(card.toModel().toJson()));
      final statusCode = response.statusCode;

      if (statusCode != 200) {
        throw Exception(statusCode);
      }

      final data = jsonDecode(response.body);

      if (data != null) {
        updatedCard =
            Card.fromModel(CardModel.fromJson(data).copyWith(id: card.id));
        completer.complete(updatedCard);
      }
    } catch (e) {
      completer.completeError(e);
    }

    return completer.future;
  }

  @override
  Future<Card> deleteCard(Card card) async {
    final completer = Completer<Card>();

    try {
      final httpClient = client ?? http.Client();

      final parsedUrl = Uri.parse('$url/${card.id}.json');

      final response = await httpClient.delete(parsedUrl);
      final statusCode = response.statusCode;

      if (statusCode != 200) {
        throw Exception(statusCode);
      }

      completer.complete(card);
    } catch (e) {
      completer.completeError(e);
    }

    return completer.future;
  }
  
  @override
  Future<Card> addCard(Card card) async {
    final completer = Completer<Card>();

    try {
      final httpClient = client ?? http.Client();

      final parsedUrl = Uri.parse('$url.json');

      final response = await httpClient.post(parsedUrl, body: jsonEncode(card.toModel().toJson()));

      final statusCode = response.statusCode;

      if (statusCode != 200) {
        throw Exception(statusCode);
      }

      final data = jsonDecode(response.body);

      if (data != null) {
        final newCard = Card.fromModel(CardModel.fromJson(data).copyWith(id: data['name']));
        completer.complete(newCard);
      }

    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }
}
