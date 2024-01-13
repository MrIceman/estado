import 'package:estado/state/event.dart';

abstract class EventObserver {
  void notify(ViewEvent? state);
}

@Deprecated("use EventObserver instead")
abstract class StateObserver {
  Map<String, Function> getHandleStateFunctions();

  void notify(ViewEvent? state);

  void cleanUp();
}
