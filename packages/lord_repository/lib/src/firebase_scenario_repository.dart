import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:lord_repository/lord_repository.dart';

class FirebaseScenarioRepository implements ScenarioRepository {
  static const url =
      'https://lord-of-the-rings-card-game-default-rtdb.europe-west1.firebasedatabase.app/card';

  FirebaseScenarioRepository({this.client});

  final http.Client? client;

  @override
  Future<Scenario> addScenario(Scenario scenario) async {
    final Completer<Scenario> completer = Completer<Scenario>();

    try {
      final httpClient = client ?? http.Client();

      final parsedUrl = Uri.parse('$url.json');
      final response = await httpClient.post(
        parsedUrl,
        body: jsonEncode(scenario.toModel().toJson()),
      );

      final statusCode = response.statusCode;

      if (statusCode != 200) {
        throw Exception(statusCode);
      }

      final data = jsonDecode(response.body);

      completer.complete(scenario.copyWith(id: data['name']));
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
  Future<void> deleteScenario(Scenario scenario) async {
    final Completer<void> completer = Completer<void>();

    try {
      final httpClient = client ?? http.Client();

      final parsedUrl = Uri.parse('$url/${scenario.id}.json');
      final response = await httpClient.delete(parsedUrl);

      final statusCode = response.statusCode;

      if (statusCode != 200) {
        throw Exception(statusCode);
      }

      completer.complete();
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
  Future<List<Scenario>> getAllScenarios() async {
    Completer<List<Scenario>> completer = Completer<List<Scenario>>();

    try {
      final httpClient = client ?? http.Client();

      final parsedUrl = Uri.parse('$url.json');
      final response = await httpClient.get(parsedUrl);
      final statusCode = response.statusCode;

      if (statusCode != 200) {
        throw Exception(statusCode);
      }

      final data = jsonDecode(response.body);
      final scenarios = <Scenario>[];

      if (data != null) {
        data.forEach((key, value) {
          final scenario = Scenario.fromModel(
            ScenarioModel.fromJson(value).copyWith(id: key),
          );
          scenarios.add(scenario);
        });
      }

      completer.complete(scenarios);
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
  Future<Scenario> updateScenario(Scenario scenario) async {
    Completer<Scenario> completer = Completer<Scenario>();

    try {
      Scenario updatedScenario;

      final httpClient = client ?? http.Client();

      final parsedUrl = Uri.parse('$url/${scenario.id}.json');
      final response = await httpClient.put(
        parsedUrl,
        body: jsonEncode(scenario.toModel().toJson()),
      );

      final statusCode = response.statusCode;

      if (statusCode != 200) {
        throw Exception(statusCode);
      }

      final data = jsonDecode(response.body);

      if (data != null) {
        updatedScenario = Scenario.fromModel(
            ScenarioModel.fromJson(data).copyWith(id: scenario.id));
        completer.complete(updatedScenario);
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
