import 'package:estado/state/state.dart';

import 'observer.dart';

@Deprecated("use EventViewModel instead")
abstract class ViewModel {
  final List<StateObserver> _observerList = List.empty(growable: true);

  void subscribe(StateObserver o) {
    if (_observerList.contains(o)) return;

    _observerList.add(o);
  }

  bool unsubscribe(StateObserver o) {
    if (_observerList.contains(o)) {
      o.cleanUp();
      _observerList.remove(o);
      return true;
    } else {
      return false;
    }
  }

  void notify(ViewState state) {
    for (var element in _observerList) {
      element.notify(state);
    }
  }
}

abstract class EventViewModel {
  final List<EventObserver> _observerList = List.empty(growable: true);

  void subscribe(EventObserver o) {
    if (_observerList.contains(o)) return;

    _observerList.add(o);
  }

  bool unsubscribe(EventObserver o) {
    if (_observerList.contains(o)) {
      o.cleanUp();
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
