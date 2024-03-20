part of 'cards_bloc.dart';

@immutable
sealed class CardsEvent {}

class FetchAndSetCards extends CardsEvent {
  FetchAndSetCards();
}

class GetAllCards extends CardsEvent {
  GetAllCards();
}

class AddCard extends CardsEvent {
  //C
  AddCard(this.card);
  final Card card;
}

class GetCardById extends CardsEvent {
  //R
  GetCardById(this.id);
  final String id;
}

class UpdateCard extends CardsEvent {
  //U
  UpdateCard(this.card);
  final Card card;
}

class DeleteCard extends CardsEvent {
  //D
  DeleteCard(this.card);
  final Card card;
}
