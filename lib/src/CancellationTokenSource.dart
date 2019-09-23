import 'CancellationToken.dart';

abstract class CancellationTokenSource {
  bool get isCancellationRequested;
  CancellationToken get token;
  void cancel();
}
