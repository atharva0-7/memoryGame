import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/bloc/card.state.dart';
import 'package:memory_game/bloc/card_event.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(CardInitialState()) {
    on<GetCardDataEvent>((event, emit) {
      emit(CardLoadedState(
          isAddedList: [],
          card: null,
          resultCount: 0,
          correctSelectedList: []));
    });

    on<CardUpdateEvent>((event, emit) {
      if (event.card.isSelected) {
        event.card.isSelected = false;
        (state as CardLoadedState).isAddedList.remove(event.card);
      } else {
        event.card.isSelected = true;
        (state as CardLoadedState).isAddedList.add(event.card);
      }

      if ((state as CardLoadedState).isAddedList.length == 2) {
        if ((state as CardLoadedState).isAddedList[0].id ==
            (state as CardLoadedState).isAddedList[1].id) {
          (state as CardLoadedState).resultCount++;
          (state as CardLoadedState)
              .correctSelectedList
              .add((state as CardLoadedState).isAddedList[0]);
          (state as CardLoadedState)
              .correctSelectedList
              .add((state as CardLoadedState).isAddedList[1]);
          // print(correctSelectedList);
        }
        (state as CardLoadedState).isAddedList.clear();
      }

      emit(
        CardLoadedState(
            card: event.card,
            resultCount: (state as CardLoadedState).resultCount,
            isAddedList: (state as CardLoadedState).isAddedList,
            correctSelectedList:
                (state as CardLoadedState).correctSelectedList),
      );
    });
  }
}
