import 'dart:async';

import "SimpleCancellationTokenSource.dart";

class TimeoutCancellationTokenSource extends SimpleCancellationTokenSource {
  Timer _timeoutHandler;

  TimeoutCancellationTokenSource(Duration timeout) {
    this._timeoutHandler = Timer(timeout, () {
      if (this._timeoutHandler != null) {
        this._timeoutHandler = null;
      }
      super.cancel();
    });
  }

  void cancel() {
    if (this._timeoutHandler != null) {
      this._timeoutHandler.cancel();
      this._timeoutHandler = null;
    }
    super.cancel();
  }

  /**
   * After call this method, the instance behaves is as `SimpleCancellationTokenSource`
   */
  void stopTimer() {
    if (this._timeoutHandler != null) {
      this._timeoutHandler.cancel();
      this._timeoutHandler = null;
    }
  }
}
