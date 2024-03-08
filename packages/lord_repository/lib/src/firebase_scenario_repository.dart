import 'dart:convert';
import 'package:lord_repository/lord_repository.dart';
import 'package:http/http.dart' as http;

class FirebaseScenarioRepository implements ScenarioRepository {
  static const url = 'http://127.0.0.1:9000/scenario';
  static const dbName = '?ns=card-7d2cb';
  FirebaseScenarioRepository();

  @override
  Future<List<Scenario>> getAllScenarios() async {
    try {
      final List<Scenario> scenarios = [];

      final parsedUrl = Uri.parse('$url.json$dbName');
      final response = await http.get(parsedUrl);
      final statusCode = response.statusCode;
      if (statusCode != 200) {
        throw Exception(statusCode);
      }

      final jsonString = response.body;
      final data = jsonDecode(jsonString);
      for (final scenario in data) {
        scenarios.add(Scenario.fromModel(ScenarioModel.fromJson(scenario)));
      }
      return scenarios;
    } catch (e) {
      throw Exception(e);
    }
  }
}
