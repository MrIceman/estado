
import 'package:estado/demo/TestViewModel.dart';
import 'package:estado/state/event.dart';
import 'package:estado/state/viewstate.dart';
import 'package:flutter/cupertino.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<StatefulWidget> createState() => TestWidgetState();
}

class TestWidgetState extends ViewState<TestViewModel, TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  TestViewModel buildViewModel() {
    throw UnimplementedError();
  }

  @override
  void notify(ViewEvent? state) {
  }

  @override
  void onViewModelReady() {
  }
}