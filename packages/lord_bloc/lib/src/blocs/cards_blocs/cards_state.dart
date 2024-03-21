part of 'cards_bloc.dart';

enum CardsStatus { initial, loading, success, failure }

class CardsState extends Equatable {
  const CardsState({
    this.status = CardsStatus.initial,
    this.cards = const <Card>[],
  });

  final CardsStatus status;
  final List<Card> cards;

  CardsState copyWith({
    CardsStatus? status,
    List<Card>? cards,
  }) {
    return CardsState(
      status: status ?? this.status,
      cards: cards ?? this.cards,
    );
  }

  @override
  List<Object> get props => [status, cards];
}
