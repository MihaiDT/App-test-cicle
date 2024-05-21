class AdjustManager {
  AdjustManager._privateConstructor();

  static final AdjustManager _instance = AdjustManager._privateConstructor();

  factory AdjustManager() {
    return _instance;
  }
}

enum EventType {
  registration,
  nameSurname,
  birthDate,
  setTutorEmail,
  privacyPolicy,
  confirmEmail,
  tutorConfirmEmail,
  login,
  lastMensesConfirmed,
  lastMensesDenied,
  mensesDurationConfirmed,
  mensesDurationDenied,
  referralCodeConfirmed,
  referralCodeDenied,
  loadProductCode,
  productCodeLoaded,
  missionCompleted;
}
