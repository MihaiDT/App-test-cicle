class RegexUtils {
  static bool isEmail(String email) {
    return RegExp(
      r'^[a-zA-Z0-9.+]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    ).hasMatch(email);
  }
}
