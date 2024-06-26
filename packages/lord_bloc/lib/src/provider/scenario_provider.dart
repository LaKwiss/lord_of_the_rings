import 'package:lord_repository/lord_repository.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

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
      dev.log('Scenarios $scenarios');
    } catch (e) {
      throw Exception(e);
    }
  }

  Scenario findById(String id) {
    return _scenarios.firstWhere((element) => element.id == id);
  }

  Future<void> updateScenario(Scenario scenario) async {
    try {
      final index =
          _scenarios.indexWhere((element) => element.id == scenario.id);
      final data = await _repository.updateScenario(scenario);
      _scenarios[index] = data;
    } catch (e) {
      throw Exception(e);
    } finally {
      notifyListeners();
    }
  }

  Future<void> deleteScenario(Scenario scenario) async {
    try {
      await _repository.deleteScenario(scenario);
      _scenarios.removeWhere((element) => element.id == scenario.id);
    } catch (e) {
      throw Exception(e);
    } finally {
      notifyListeners();
    }
  }

  Future<void> addScenario(Scenario scenario) async {
    try {
      final data = await _repository.addScenario(scenario);
      _scenarios.add(data);
    } catch (e) {
      throw Exception(e);
    } finally {
      notifyListeners();
    }
  }
}
