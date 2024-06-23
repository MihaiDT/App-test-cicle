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
  emailRequired,
  userAlreadyActive,
  userAlreadyRegistered,
  userNotFound,
  invitationCodeNotValid,
  productCodeNotValid,
  productCodeExternal,
  productCodeUploadFailed,
  productCodeAlreadyUsed;

  String get errorText {
    switch (this) {
      case ErrorType.generic:
        return "Si è verificato un errore";
      case ErrorType.wrongPassword:
        return "Credenziali non valide";
      case ErrorType.emailRequired:
        return "E-mail obbligatoria";
      case ErrorType.invitationCodeNotValid:
        return "Codice invito non valido";
      case ErrorType.userAlreadyActive:
        return "L'utente è già attivo";
      case ErrorType.userAlreadyRegistered:
        return "Utente già registrato";
      case ErrorType.userNotFound:
        return "Credenziali non valide";
      case ErrorType.productCodeNotValid:
        return "Il codice prodotto non è stato riconosciuto";
      case ErrorType.productCodeExternal:
        return "Il codice prodotto non è corretto.\nCarica il codice prodotto che trovi stampato all’interno della confezione.";
      case ErrorType.productCodeUploadFailed:
        return "Il caricamento del codice non è andato a buon fine";
      case ErrorType.productCodeAlreadyUsed:
        return "Il codice risulta già caricato, carica un altro codice.";
    }
  }
}

extension ErrorTypeExtension on ErrorType {
  static ErrorType fromString(String errorType) {
    switch (errorType.toLowerCase()) {
      case "email_required":
        return ErrorType.emailRequired;
      case "user_not_found":
        return ErrorType.emailRequired;
      case "invitation_code_not_valid":
        return ErrorType.invitationCodeNotValid;
      case "wrong_password":
        return ErrorType.wrongPassword;
      case "user_already_active":
        return ErrorType.userAlreadyActive;
      case "product_code_not_valid":
        return ErrorType.productCodeNotValid;
      case "product_code_external":
        return ErrorType.productCodeExternal;
      case "product_code_upload_failed":
        return ErrorType.productCodeUploadFailed;
      case "product_code_already_uploaded":
        return ErrorType.productCodeAlreadyUsed;
      case "user_already_registered":
        return ErrorType.userAlreadyRegistered;
      default:
        return ErrorType.generic;
    }
  }
}
