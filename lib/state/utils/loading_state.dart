import 'package:estado/state/state.dart';

@Deprecated("use LoadingEvent instead")
class LoadingState extends ViewState {
  static const String name = "ESTADO_LOADING_STATE";
  bool isLoading;

  LoadingState(this.isLoading) : super(name);

  @override
  bool operator ==(Object other) {
    return super == other && (other as LoadingState).isLoading == isLoading;
  }

  @override
  int get hashCode => super.hashCode;
}
