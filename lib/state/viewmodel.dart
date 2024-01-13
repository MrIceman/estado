import 'event.dart';
import 'observer.dart';

abstract class EventViewModel {
  final List<EventObserver> _observerList = List.empty(growable: true);

  void subscribe(EventObserver o) {
    if (_observerList.contains(o)) return;

    _observerList.add(o);
  }

  bool unsubscribe(EventObserver o) {
    if (_observerList.contains(o)) {
      _observerList.remove(o);
      return true;
    } else {
      return false;
    }
  }

  void notify(ViewEvent state) {
    for (var element in _observerList) {
      element.notify(state);
    }
  }
}
