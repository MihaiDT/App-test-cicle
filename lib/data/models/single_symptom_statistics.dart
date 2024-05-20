class SingleSymptomStatistic {
  final int day;
  final PeriodPhase periodPhase;

  SingleSymptomStatistic({
    required this.day,
    required this.periodPhase,
  });

  factory SingleSymptomStatistic.fromJson(Map<String, dynamic> json) {
    return SingleSymptomStatistic(
      day: json['day'],
      periodPhase: PeriodPhase.fromString(json['phase']),
    );
  }
}

enum PeriodPhase {
  ovulation,
  menstruation,
  luteal,
  follicular;

  static PeriodPhase fromString(String value) {
    switch (value) {
      case "ovulation":
        return PeriodPhase.ovulation;
      case "menstruation":
        return PeriodPhase.menstruation;
      case "luteal":
        return PeriodPhase.luteal;
      case "follicular":
        return PeriodPhase.follicular;
      default:
        throw Exception("Invalid value");
    }
  }
}
