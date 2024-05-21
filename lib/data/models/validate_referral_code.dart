class ValidateReferralCode {
  final bool isValid;

  ValidateReferralCode({
    required this.isValid,
  });

  factory ValidateReferralCode.fromJson(Map<String, dynamic> json) {
    return ValidateReferralCode(
      isValid: json['valid'],
    );
  }
}
