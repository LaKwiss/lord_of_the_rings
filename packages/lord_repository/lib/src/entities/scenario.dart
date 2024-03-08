import 'package:equatable/equatable.dart';
import '../models/scenario_model.dart';

class Scenario extends Equatable {
  const Scenario(
    this.name,
    this.difficulty,
  );

  factory Scenario.fromModel(ScenarioModel model) {
    return Scenario(
      model.name,
      model.difficulty,
    );
  }

  final String name;
  final int difficulty;

  @override
  List<Object> get props => [name, difficulty];
}
