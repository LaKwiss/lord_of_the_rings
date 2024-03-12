import 'package:lord_repository/lord_repository.dart';

abstract class ScenarioRepository {
  Future<List<Scenario>> getAllScenarios();
  Future<Scenario> updateScenario(Scenario scenario);
  Future<void> deleteScenario(Scenario scenario);
  Future<Scenario> addScenario(Scenario scenario);
}
