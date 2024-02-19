class Mission {
  final int currentCodes;
  final String description;
  final String? imageUrl;
  final int totalCodes;
  final String untilDate;

  Mission({
    required this.currentCodes,
    this.imageUrl,
    required this.description,
    required this.totalCodes,
    required this.untilDate,
  });
}
