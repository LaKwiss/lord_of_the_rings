import 'package:equatable/equatable.dart';
import 'package:lord_repository/lord_repository.dart';

class Scenario extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageSrc;

  const Scenario({
    required this.id,
    required this.name,
    required this.description,
    required this.imageSrc,
  });

  Scenario copyWith({
    String? id,
    String? name,
    String? description,
    String? imageSrc,
  }) {
    return Scenario(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageSrc: imageSrc ?? this.imageSrc,
    );
  }

  ScenarioModel toModel() {
    return ScenarioModel(
      id: id,
      name: name,
      description: description,
      imageSrc: imageSrc,
    );
  }

  factory Scenario.fromModel(ScenarioModel model) {
    return Scenario(
      id: model.id,
      name: model.name,
      description: model.description,
      imageSrc: model.imageSrc,
    );
  }

  @override
  List<Object> get props => [id, name, description, imageSrc];
}
