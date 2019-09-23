//import { AggregateError, CancelledError, wrapErrorIfNeeded } from "@zxteam/errors";

import "CancellationToken.dart";
import "CancellationTokenSource.dart";
import 'Errors.dart';

class SimpleCancellationTokenSource implements CancellationTokenSource {
  final List<Function> _cancelListeners = List();
  bool _isCancellationRequested = false;

  CancellationToken get token => _CancellationToken(this);

  bool get isCancellationRequested => this._isCancellationRequested;

  void cancel() {
    if (this._isCancellationRequested) {
      // Prevent to call listeners twice (if listener call cancel() itself)
      return;
    }
    this._isCancellationRequested = true;
    final List<Error> errors = List();
    if (this._cancelListeners.length > 0) {
      // Release callback. We do not need its anymore
      final cancelListeners = List<Function>.from(this._cancelListeners);
      cancelListeners.forEach((cancelListener) {
        try {
          cancelListener();
        } catch (e) {
          errors.add(e is Error ? e : CancellationWrapError(e));
        }
      });

      if (errors.length > 0) {
        throw CancellationAggregateError(errors);
      }
    }
  }

  void _addCancelListener(CancelCallback cb) {
    this._cancelListeners.add(cb);
  }

  void _removeCancelListener(CancelCallback cb) {
    this._cancelListeners.remove(cb);
  }

  void _throwIfCancellationRequested() {
    if (this._isCancellationRequested) {
      throw CancelledError();
    }
  }
}

class _CancellationToken implements CancellationToken {
  final SimpleCancellationTokenSource _owner;
  _CancellationToken(this._owner);
  bool get isCancellationRequested => false;
  void addCancelListener(CancelCallback cb) {
    this._owner._addCancelListener(cb);
  }

  void removeCancelListener(CancelCallback cb) {
    this._owner._removeCancelListener(cb);
  }

  void throwIfCancellationRequested() {
    this._owner._throwIfCancellationRequested();
  }
}
