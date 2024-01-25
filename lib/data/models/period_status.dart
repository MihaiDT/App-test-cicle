import 'package:lines/data/enums/period_phase.dart';

class PeriodStatus {
  final String date;
  final bool real;
  final PeriodPhase periodPhase;

  PeriodStatus({
    required this.date,
    required this.real,
    required this.periodPhase,
  });

  factory PeriodStatus.fromJson(Map<String, dynamic> data) {
    return PeriodStatus(
        date: data['date'],
        real: data['real'],
        periodPhase: PeriodPhase.fromString(data['period_phase'] as String));
  }

  @override
  String toString() {
    return 'PeriodStatus{date: $date, real: $real, periodPhase: ${periodPhase.name}';
  }
}
