import 'package:estado/state/utils/loading_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("two loading events should be considered to be the same", () {
    final eventA = LoadingEvent(true);
    final eventB = LoadingEvent(true);

    expect(eventA, eventB);
  });
}