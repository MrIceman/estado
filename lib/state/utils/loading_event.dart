import 'package:estado/state/event.dart';

class LoadingEvent extends ViewEvent {
  static const String name = "DEFAULT_LOADING_EVENT";
  bool isLoading;

  LoadingEvent(this.isLoading) : super(name);
}
