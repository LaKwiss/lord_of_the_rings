import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lord_repository/lord_repository.dart';
import 'package:equatable/equatable.dart';

sealed class CardEvent {}

final class GetAllCards extends CardEvent {}

final class GetCard extends CardEvent {
  final String id;
  GetCard(this.id);
}

final class AddCard extends CardEvent {
  final Card card;
  AddCard(this.card);
}

final class UpdateCard extends CardEvent {
  final Card card;
  UpdateCard(this.card);
}

final class DeleteCard extends CardEvent {
  final Card card;
  DeleteCard(this.card);
}

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc(this.cardRepository) : super(CardInitial());

  final CardRepository cardRepository;
}

class CardState extends Equatable {
  @override
  List<Object> get props => [];
}

class CardInitial extends CardState {}
