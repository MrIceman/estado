import 'package:estado/state/state.dart';

@Deprecated("use LoadingEvent instead")
class LoadingState extends ViewState {
  static const String name = "ESTADO_LOADING_STATE";
  bool isLoading;

  LoadingState(this.isLoading) : super(name);
}