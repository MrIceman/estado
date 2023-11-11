import 'package:estado/state/event.dart';

class ItemLoadedEvent<T> extends ViewEvent {
  final T item;

  ItemLoadedEvent(this.item) : super("ItemLoadedEvent");
}
