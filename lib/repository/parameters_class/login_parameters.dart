class LoginParameters {
  final String email;
  final String password;

  LoginParameters({
    required this.email,
    this.password = "",
  });
}
