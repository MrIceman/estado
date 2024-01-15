import 'package:estado/state/observer.dart';
import 'package:estado/state/viewmodel.dart';
import 'package:flutter/cupertino.dart';

abstract class ViewState<VM extends EventViewModel> extends State
    implements EventObserver {
  late VM viewModel;

  @override
  void initState() {
    super.initState();
    this.viewModel = getViewModel();
    this.viewModel.subscribe(this);
    this.onViewModelReady();
  }

  @override
  void dispose() {
    this.viewModel.unsubscribe(this);
    super.dispose();
  }

  VM getViewModel();

  void onViewModelReady();
}
