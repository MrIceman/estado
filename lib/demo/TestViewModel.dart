import 'package:estado/state/utils/loading_event.dart';
import 'package:estado/state/viewmodel.dart';

class TestViewModel extends EventViewModel {
  static final TestViewModel _instance = TestViewModel._();

  factory TestViewModel() => _instance;

  TestViewModel._();

  void test() {
    notify(LoadingEvent(true));
  }
}
