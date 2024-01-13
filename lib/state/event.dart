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
