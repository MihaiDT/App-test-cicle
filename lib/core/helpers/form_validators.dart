extension $formValidatorString on String {
  bool get isValidPassword {
    return isPasswordRightLength &&
        containsNumberChars &&
        containsLowercaseChars &&
        containsUpperaseChars &&
        containsSpecialChars;
  }

  bool get isPasswordRightLength => length > 7;

  bool get containsNumberChars => RegExp(r'[0-9]').hasMatch(this);

  bool get containsUpperaseChars => RegExp(r'[A-Z]').hasMatch(this);

  bool get containsLowercaseChars => RegExp(r'[a-z]').hasMatch(this);

  bool get containsSpecialChars =>
      RegExp(r'[!@#$%\-/\\€;£=_^&*(),.?":{}|<>]').hasMatch(this);
}
