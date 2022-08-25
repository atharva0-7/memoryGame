import 'package:memory_game/model/card_model.dart';

abstract class CardState {}

class CardInitialState extends CardState {}

class CardLoadedState extends CardState {
  CardModel? card;
  int resultCount;
  List<CardModel> isAddedList;
  List<CardModel> correctSelectedList;
  CardLoadedState(
      {required this.correctSelectedList,
      required this.card,
      required this.resultCount,
      required this.isAddedList});
}
