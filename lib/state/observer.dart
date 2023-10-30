import 'package:estado/state/state.dart';

mixin ViewModelObserver {
  Map<String, Function>? _stateHandlers;

  Map<String, Function> getHandleStateFunctions();

  void notify(ViewState state) {
    _stateHandlers ??= getHandleStateFunctions();

    _stateHandlers?[state.qualifier]?.call(state);
  }

  void cleanUp() {
    _stateHandlers = null;
  }
}

mixin ViewModelEventObserver {
  Map<String, Function>? _eventHandlers;

  Map<String, Function> getHandleEventFunctions();

  void notify(ViewEvent state) {
    _eventHandlers ??= getHandleEventFunctions();

    _eventHandlers?[state.qualifier]?.call(state);
  }

  void cleanUp() {
    _eventHandlers = null;
  }
}

@Deprecated("use EventObserver instead")
abstract class StateObserver {
  Map<String, Function> getHandleStateFunctions();

  void notify(ViewState? state);

  void cleanUp();
}

abstract class EventObserver {
  Map<String, Function> getHandleStateFunctions();

  void notify(ViewEvent? state);

  void cleanUp();
}
