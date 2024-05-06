extension NumExtension on double {
  /// Check if the input is an integer
  bool get isInteger {
    return this == toInt().toDouble();
  }
}
