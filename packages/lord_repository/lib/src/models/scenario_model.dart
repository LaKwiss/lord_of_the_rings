import 'package:equatable/equatable.dart';

class ScenarioModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageSrc;

  const ScenarioModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageSrc,
  });

  factory ScenarioModel.fromJson(Map<String, dynamic> json) {
    return ScenarioModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageSrc: json['imageSrc'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageSrc': imageSrc,
    };
  }

  @override
  List<Object> get props => [id, name, description, imageSrc];
}
