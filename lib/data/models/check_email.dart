class CheckEmail {
  /// True if the email is already registered
  bool? emailExists;

  /// True if the user has already completed the email verification
  bool? emailIsActive;

  CheckEmail({
    this.emailExists,
    this.emailIsActive,
  });

  factory CheckEmail.fromJson(Map<String, dynamic> json) {
    return CheckEmail(
      emailExists: json['exists'],
      emailIsActive: json['active'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['exists'] = emailExists;
    data['active'] = emailIsActive;
    return data;
  }
}
