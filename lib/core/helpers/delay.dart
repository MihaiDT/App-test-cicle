Future wait({int seconds = 2, int milliseconds = 0}) async {
  return Future.delayed(
    milliseconds > 0
        ? Duration(milliseconds: milliseconds)
        : Duration(seconds: seconds),
    () async {},
  );
}
