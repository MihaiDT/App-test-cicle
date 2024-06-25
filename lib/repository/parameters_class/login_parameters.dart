class LoginParameters {
  final bool? cookieProfiling;
  final bool? cookieStats;
  final String email;
  final String password;

  LoginParameters({
    this.cookieProfiling,
    this.cookieStats,
    required this.email,
    this.password = "",
  });
}
