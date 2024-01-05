/// Wrapper class containing request status and error
class ResponseHandler<T> {
  final RequestStatus status;
  final ErrorType? errorType;
  final T? content;

  ResponseHandler.failed({
    this.errorType = ErrorType.generic,
    this.content,
  }) : status = RequestStatus.failed;

  ResponseHandler.pending({this.content})
      : status = RequestStatus.pending,
        errorType = null;

  ResponseHandler.successful({this.content})
      : status = RequestStatus.success,
        errorType = null;

  ResponseHandler.initial()
      : status = RequestStatus.initial,
        errorType = null,
        content = null;

  bool get hasError => errorType != null;

  bool get isInitial => status == RequestStatus.initial;

  bool get isPending => status == RequestStatus.pending;

  bool get isFailed => status == RequestStatus.failed;

  bool get isSuccesful => status == RequestStatus.success;
}

/// Enum used to identify request status
enum RequestStatus {
  initial,
  pending,
  failed,
  success,
}

enum ErrorType {
  generic,
}
