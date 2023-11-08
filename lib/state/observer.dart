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

abstract class EventObserver {
  void notify(ViewEvent? state);
}


@Deprecated("use EventObserver instead")
abstract class StateObserver {
  Map<String, Function> getHandleStateFunctions();

  void notify(ViewState? state);

  void cleanUp();
}

