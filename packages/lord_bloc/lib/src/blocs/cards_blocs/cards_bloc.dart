import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lord_repository/lord_repository.dart';
import 'package:meta/meta.dart';

part 'cards_event.dart';
part 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  CardsBloc({required this.cardRepository})
      : super(const CardsState(status: CardsStatus.initial)) {
    on<FetchAndSetCards>(_onFetchAndSetCards);
  }

  final CardRepository cardRepository;

  Future<void> _onFetchAndSetCards(
      FetchAndSetCards event, Emitter<CardsState> emit) async {
    try {
      final cards = await cardRepository.getAllCards();
      emit(state.copyWith(status: CardsStatus.success, cards: cards));
    } catch (_) {
      emit(state.copyWith(status: CardsStatus.failure));
    }
  }
}
