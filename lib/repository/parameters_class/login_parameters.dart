class LoginParameters {
  final bool cookieProfiling;
  final bool cookieStats;
  final String email;
  final String password;

  LoginParameters({
    required this.cookieProfiling,
    required this.cookieStats,
    required this.email,
    this.password = "",
  });
}
