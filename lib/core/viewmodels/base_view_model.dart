import 'package:flutter_swapi_sample/core/enums/view_state.dart';

class BaseViewModel {
  ViewState state = ViewState.Idle;
  String error = '';

  void setIdle(Function notifyListeners) =>
      _setViewState(ViewState.Idle, notifyListeners);

  void setBusy(Function notifyListeners) =>
      _setViewState(ViewState.Busy, notifyListeners);

  void _setViewState(ViewState viewState, Function notifyListeners) {
    state = viewState;
    notifyListeners();
  }

  bool hasError() {
    return error.length > 0;
  }
}
