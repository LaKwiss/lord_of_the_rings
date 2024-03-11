import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:lord_repository/lord_repository.dart';
import 'package:lord_repository/src/models/deck_model.dart';
import 'package:http/http.dart' as http;

import 'dart:developer' as dev;

class FirebaseDeckRepository implements DeckRepository {
  static const url =
      'https://lord-of-the-rings-card-game-default-rtdb.europe-west1.firebasedatabase.app/deck';
  FirebaseDeckRepository({this.client});

  final http.Client? client;

  @override
  Future<List<Deck>> getAllDecks() async {
    final completer = Completer<List<Deck>>();

    try {
      final List<Deck> decks = [];

      final parsedUrl = Uri.parse('$url.json');
      final response = await http.get(parsedUrl);
      final statusCode = response.statusCode;

      if (statusCode != 200) {
        throw Exception(statusCode);
      }

      final jsonString = response.body;
      final data = jsonDecode(jsonString) as Map<String, dynamic>;

      if (data != null) {
        data.forEach(
          (deckId, deckData) {
            decks.add(
              Deck.fromModel(
                DeckModel.fromJson(deckData).copyWith(id: deckId),
              ),
            );
          },
        );
      }
      completer.complete(decks);
      if (decks.isEmpty) {
        completer.completeError('No decks found');
      }
    } on HttpException catch (_) {
      completer.completeError('Page non trouvée');
    } on SocketException catch (_) {
      completer.completeError('Pas de connexion internet');
    } catch (e) {
      completer.completeError(e);
    }

    return completer.future;
  }

  @override
  Future<Deck> addDeck(Deck deck) async {
    final completer = Completer<Deck>();

    try {
      final httpClient = client ?? http.Client();

      final parsedUrl = Uri.parse('$url.json');

      final response = await httpClient.post(parsedUrl,
          body: jsonEncode(deck.toModel().toJson()));

      final statusCode = response.statusCode;

      if (statusCode != 200) {
        throw Exception(statusCode);
      }

      final data = jsonDecode(response.body);

      if (data != null) {
        final newDeck =
            Deck.fromModel(DeckModel.fromJson(data).copyWith(id: data['name']));
        completer.complete(newDeck);
      }
    } on HttpException catch (_) {
      completer.completeError('Page non trouvée');
    } on SocketException catch (_) {
      completer.completeError('Pas de connexion internet');
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }

  @override
  Future<Deck> deleteDeck(Deck deck) async {
    final completer = Completer<Deck>();

    try {
      final httpClient = client ?? http.Client();

      final parsedUrl = Uri.parse('$url/${deck.id}.json');

      final response = await httpClient.delete(parsedUrl);
      final statusCode = response.statusCode;

      if (statusCode != 200) {
        throw Exception(statusCode);
      }

      completer.complete(deck);
    } on HttpException catch (_) {
      completer.completeError('Page non trouvée');
    } on SocketException catch (_) {
      completer.completeError('Pas de connexion internet');
    } catch (e) {
      completer.completeError(e);
    }

    return completer.future;
  }

  @override
  Future<Deck> updateDeck(Deck deck) async {
    final completer = Completer<Deck>();

    try {
      Deck updatedDeck;

      final httpClient = client ?? http.Client();

      final parsedUrl = Uri.parse('$url/${deck.id}.json');

      final response = await httpClient.patch(parsedUrl,
          body: jsonEncode(deck.toModel().toJson()));

      final statusCode = response.statusCode;

      if (statusCode != 200) {
        throw Exception(statusCode);
      }

      final data = jsonDecode(response.body);

      if (data != null) {
        updatedDeck =
            Deck.fromModel(DeckModel.fromJson(data).copyWith(id: deck.id));
        completer.complete(updatedDeck);
      }
    } on HttpException catch (_) {
      completer.completeError('Page non trouvée');
    } on SocketException catch (_) {
      completer.completeError('Pas de connexion internet');
    } catch (e) {
      completer.completeError(e);
    }

    return completer.future;
  }
}
