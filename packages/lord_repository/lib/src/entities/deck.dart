// ignore_for_file: must_be_immutable

import 'package:lord_repository/src/models/deck_model.dart';
import 'package:equatable/equatable.dart';

class Deck extends Equatable {
  Deck(this.id, this.name, this.listCardsIds);

  String id;
  final String name;
  List<dynamic> listCardsIds = [];

  @override
  List<Object?> get props => [name, listCardsIds];

  factory Deck.fromModel(DeckModel model) {
    return Deck(
      model.id,
      model.name,
      model.listCardsIds,
    );
  }

  DeckModel toModel() {
    return DeckModel(
      id: id,
      name: name,
      listCardsIds: listCardsIds,
    );
  }

  Deck copyWith({String? id, String? name, List<dynamic>? listCardsIds}) {
    return Deck(
      id ?? this.id,
      name ?? this.name,
      listCardsIds ?? this.listCardsIds,
    );
  }
}
