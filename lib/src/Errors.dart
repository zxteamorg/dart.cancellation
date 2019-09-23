class CancelledError extends Error {
  //
}

class CancellationAggregateError extends Error {
  final Iterable<Error> innerErrors;

  CancellationAggregateError(this.innerErrors);
}

class CancellationWrapError extends Error {
  final dynamic wrap;
  CancellationWrapError(this.wrap);
}
