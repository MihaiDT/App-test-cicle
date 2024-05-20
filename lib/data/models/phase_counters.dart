class PhasesCounter {
  final int totalMensesDays;
  final int totalOvulationDays;
  final int totalLutealDays;
  final int totalFollicularDays;

  PhasesCounter({
    required this.totalMensesDays,
    required this.totalOvulationDays,
    required this.totalLutealDays,
    required this.totalFollicularDays,
  });

  factory PhasesCounter.fromJson(Map<String, dynamic> json) {
    return PhasesCounter(
      totalMensesDays: json['menstruation'],
      totalOvulationDays: json['ovulation'],
      totalLutealDays: json['luteal'],
      totalFollicularDays: (json['follicular']).abs(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ovulation': totalMensesDays,
      'luteal': totalLutealDays,
      'follicular': totalFollicularDays,
    };
  }

  @override
  String toString() {
    return 'PhasesCounter{ovulationPeriodDays: $totalMensesDays, totalOvulationDays: $totalOvulationDays, totalLutealDays: $totalLutealDays, totalFollicularDays: $totalFollicularDays}';
  }
}
