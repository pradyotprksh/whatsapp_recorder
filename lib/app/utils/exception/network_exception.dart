/// A network exception which will be thrown when a network error occurs.
class NetworkException implements Exception {
  /// [message] : A message for the exception.
  /// [errorCode] : An error code which got from the network.
  NetworkException({
    this.message,
    this.errorCode,
  });

  String message;
  int errorCode;

  @override
  String toString() => '$errorCode : $message';
}
