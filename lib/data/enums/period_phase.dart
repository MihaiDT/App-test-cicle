enum PeriodPhase {
  menstruation,
  noPhase;

  static PeriodPhase fromString(String value) {
    switch (value.toLowerCase()) {
      case 'menstruation':
        return PeriodPhase.menstruation;
      default:
        return PeriodPhase.noPhase;
    }
  }
}
