// ignore_for_file: must_be_immutable

import 'package:lord_repository/src/models/deck_model.dart';
import 'package:equatable/equatable.dart';

class Deck extends Equatable {
  Deck(this.id, this.name, this.listCardsIds);

  final String id;
  final String name;
  List<int> listCardsIds = [];

  @override
  List<Object?> get props => [name, listCardsIds];

  factory Deck.fromModel(DeckModel model) {
    return Deck(
      model.id,
      model.name,
      model.listCardsIds,
    );
  }
}
