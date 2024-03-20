import 'package:bloc/bloc.dart';
import 'package:lord_repository/lord_repository.dart';
import 'package:meta/meta.dart';

part 'cards_event.dart';
part 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  CardsBloc() : super(CardsInitial()) {
    final CardRepository repository = FirebaseCardRepository();

    on<FetchAndSetCards>((event, emit) async {
      try {
        final List<Card> cards = await repository.getAllCards();
        emit(CardsLoaded(cards));
      } catch (e) {
        emit(CardsError(e.toString()));
      }
    });
  }
}
