// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class DeckModel extends Equatable {
  final String id;
  final String name;
  List<dynamic> listCardsIds = [];

  DeckModel({required this.id, required this.name, required this.listCardsIds});

  factory DeckModel.fromJson(Map<String, dynamic> json) {
    return DeckModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      listCardsIds: json['listCardsIds'] ?? List<int>.empty(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "listCardsIds": listCardsIds,
    };
  }

  DeckModel copyWith({String? id, String? name, List<int>? listCardsIds}) {
    return DeckModel(
      id: id ?? this.id,
      name: name ?? this.name,
      listCardsIds: listCardsIds ?? this.listCardsIds,
    );
  }

  @override
  List<Object?> get props => [id, name, listCardsIds];
}
