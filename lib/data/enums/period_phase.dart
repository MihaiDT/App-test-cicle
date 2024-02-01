enum PeriodPhase {
  menstruation,
  ovulation,
  noPhase;

  static PeriodPhase fromString(String value) {
    switch (value.toLowerCase()) {
      case 'menstruation':
        return PeriodPhase.menstruation;
      case 'ovulation':
        return PeriodPhase.ovulation;
      default:
        return PeriodPhase.noPhase;
    }
  }
}
