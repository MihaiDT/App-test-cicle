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

  bool get isSuccessful => status == RequestStatus.success;
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
  wrongPassword,
  userAlreadyActive;

  String get errorText {
    switch (this) {
      case ErrorType.generic:
        return "C'è stato un errore";
      case ErrorType.wrongPassword:
        return "Password errata";
      case ErrorType.userAlreadyActive:
        return "L'utente è già attivo";
    }
  }
}

extension ErrorTypeExtension on ErrorType {
  static ErrorType fromString(String errorType) {
    switch (errorType.toLowerCase()) {
      case "wrong_password":
        return ErrorType.wrongPassword;
      case "user_already_active":
        return ErrorType.userAlreadyActive;
      default:
        return ErrorType.generic;
    }
  }
}
