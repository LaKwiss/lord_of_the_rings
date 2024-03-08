import 'package:lord_repository/lord_repository.dart';

abstract class ScenarioRepository {
  Future<List<Scenario>> getAllScenarios();
}
