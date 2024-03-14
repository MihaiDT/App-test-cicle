class ProfileCompletedAreas {
  bool zipCode;
  bool interests;
  bool periodData;

  ProfileCompletedAreas({
    this.zipCode = false,
    this.interests = false,
    this.periodData = false,
  });

  factory ProfileCompletedAreas.fromJson(Map<String, dynamic> json) {
    return ProfileCompletedAreas(
      zipCode: json['zip'],
      interests: json['interests'],
      periodData: json['period_data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "zip_code": zipCode,
      "interests": interests,
      "period_data": periodData,
    };
  }

  @override
  String toString() {
    return 'ProfileCompletedAreas{zipCode: $zipCode, interests: $interests, periodData: $periodData}';
  }
}
