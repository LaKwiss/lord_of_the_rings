import 'package:equatable/equatable.dart';

class ScenarioModel extends Equatable {
  const ScenarioModel(
    this.name,
    this.difficulty,
  );

  factory ScenarioModel.fromJson(Map<String, dynamic> map) {
    return ScenarioModel(
      map['name'] as String,
      map['difficulty'] as int,
    );
  }

  final String name;
  final int difficulty;

  @override
  List<Object> get props => [name, difficulty];
}
