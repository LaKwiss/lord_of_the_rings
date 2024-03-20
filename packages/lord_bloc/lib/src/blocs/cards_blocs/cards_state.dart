part of 'cards_bloc.dart';

@immutable
abstract class CardsState {}

class CardsInitial extends CardsState {}

class CardsEmpty extends CardsState {
  CardsEmpty();
}

class CardsLoaded extends CardsState {
  CardsLoaded(this.cards);
  final List<Card> cards;
}

class CardsError extends CardsState {
  CardsError(this.message);
  final String message;
}

class CardsLoading extends CardsState {
  CardsLoading();
}

class CardsUpdated extends CardsState {
  CardsUpdated(this.card);
  final Card card;
}

class CardsDeleted extends CardsState {
  CardsDeleted(this.cards);
  final List<Card> cards;
}

class CardsAdded extends CardsState {
  CardsAdded(this.cards);
  final List<Card> cards;
}

class CardsGetById extends CardsState {
  CardsGetById(this.card);
  final Card card;
}

class CardsGetAll extends CardsState {
  CardsGetAll(this.cards);
  final List<Card> cards;
}
