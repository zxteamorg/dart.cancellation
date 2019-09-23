abstract class CancellationToken {
  bool get isCancellationRequested;
  void addCancelListener(CancelCallback cb);
  void removeCancelListener(CancelCallback cb);
  void throwIfCancellationRequested();
}

typedef void CancelCallback();
