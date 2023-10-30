@Deprecated(
    "Use ViewEvent instead. It's the proper terminology for what a ViewModel emits")
abstract class ViewState {
  String qualifier;

  ViewState(this.qualifier);

  @override
  String toString() {
    return 'ViewState{qualifier: $qualifier}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViewState &&
          runtimeType == other.runtimeType &&
          qualifier == other.qualifier;
}

abstract class ViewEvent {
  String qualifier;

  ViewEvent(this.qualifier);

  @override
  String toString() {
    return 'ViewEvent{qualifier: $qualifier}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViewEvent &&
          runtimeType == other.runtimeType &&
          qualifier == other.qualifier;

  @override
  int get hashCode => qualifier.hashCode;
}
