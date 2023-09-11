extension $formValidatorString on String {
  bool get isValidPassword {
    return isPasswordRightLength;
    // &&
    // containsNumberChars &&
    // containsLowercaseChars &&
    // containsUpperaseChars &&
    // containsSpecialChars;
  }

  bool get isPasswordRightLength {
    return length > 7;
  }

  bool get containsNumberChars {
    return RegExp(r'[0-9]').hasMatch(this);
  }

  bool get containsUpperaseChars {
    return RegExp(r'[A-Z]').hasMatch(this);
  }

  bool get containsLowercaseChars {
    return RegExp(r'[a-z]').hasMatch(this);
  }

  bool get containsSpecialChars {
    return RegExp(r'[!@#$%\-/\\€;£=_^&*(),.?":{}|<>]').hasMatch(this);
  }
}
