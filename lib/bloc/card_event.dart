import 'package:memory_game/model/card_model.dart';

abstract class CardEvent {}

class GetCardDataEvent extends CardEvent {}

class CardUpdateEvent extends CardEvent {
  CardModel card;
  CardUpdateEvent(this.card);
}
