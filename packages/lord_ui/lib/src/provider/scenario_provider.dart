import 'package:lord_repository/lord_repository.dart';
import 'package:flutter/material.dart';

class ScenarioProvider extends ChangeNotifier {
  ScenarioProvider(this._repository);
  final List<Scenario> _scenarios = [];
  final ScenarioRepository _repository;

  List<Scenario> get scenarios => _scenarios;

  Future<void> fetchAndSetScenarios() async {
    try {
      final List<Scenario> scenarios = await _repository.getAllScenarios();
      _scenarios.clear();
      _scenarios.addAll(scenarios);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
