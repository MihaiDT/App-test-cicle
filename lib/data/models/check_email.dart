class CheckEmail {
  /// True if the email is already registered
  bool emailExists;

  /// True if the user has already completed the email verification
  bool emailIsActive;

  CheckEmail({
    required this.emailExists,
    required this.emailIsActive,
  });

  factory CheckEmail.fromJson(Map<String, dynamic> json) {
    return CheckEmail(
      emailExists: json['email_exists'],
      emailIsActive: json['email_is_active'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['email_exists'] = emailExists;
    data['email_is_active'] = emailIsActive;
    return data;
  }
}
