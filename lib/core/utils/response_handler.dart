/// Wrapper class containing request status and error
class ResponseHandler<T> {
  final ReqStatus status;
  final ErrorType? errorType;
  final T? content;

  ResponseHandler.failed({
    this.errorType = ErrorType.generic,
    this.content,
  }) : status = ReqStatus.failed;

  ResponseHandler.pending({this.content})
      : status = ReqStatus.pending,
        errorType = null;

  ResponseHandler.successful({this.content})
      : status = ReqStatus.success,
        errorType = null;

  ResponseHandler.initial()
      : status = ReqStatus.initial,
        errorType = null,
        content = null;

  bool get hasError => errorType != null;

  bool get isInitial => status == ReqStatus.initial;

  bool get isPending => status == ReqStatus.pending;

  bool get isFailed => status == ReqStatus.failed;

  bool get isSuccesful => status == ReqStatus.success;
}

/// Enum used to identify request status
enum ReqStatus {
  initial,
  pending,
  failed,
  success,
}

enum ErrorType {
  generic,
}
