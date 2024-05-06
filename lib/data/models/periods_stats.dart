class PeriodsStats {
  final String startingDate;
  final String? endingDate;
  final int periodDays;
  final int periodDuration;
  final List<int> menstruationDays;
  final List<int> ovulationDays;

  PeriodsStats({
    required this.startingDate,
    this.endingDate,
    required this.periodDays,
    required this.periodDuration,
    required this.menstruationDays,
    required this.ovulationDays,
  });

  factory PeriodsStats.fromJson(Map<String, dynamic> json) {
    return PeriodsStats(
      startingDate: json['from'],
      endingDate: json['to'],
      periodDays: json['period_days'],
      periodDuration: json['period_duration'],
      menstruationDays:
          (json['period_phases'].first['menstruation_days'] as List<dynamic>)
              .map((item) => item as int)
              .toList(),
      ovulationDays:
          (json['period_phases'].first['ovulation_days'] as List<dynamic>)
              .map((item) => item as int)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'starting_date': startingDate,
      'ending_date': endingDate,
      'period_days': periodDays,
      'period_duration': periodDuration,
      'menstruation_days': menstruationDays,
      'ovulation_days': ovulationDays,
    };
  }

  @override
  String toString() {
    return 'PeriodsStats{startingDate: $startingDate, endingDate: $endingDate, periodDays: $periodDays, periodDuration: $periodDuration, menstruationDays: $menstruationDays, ovulationDays: $ovulationDays}';
  }
}
