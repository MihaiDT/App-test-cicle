class Badge {
  final String badgeType;
  final String title;
  final String? imageUrl;

  /// The current progress of the current mission
  final int? progressValue;

  /// The total steps of the current mission
  final int? totalProgressValue;

  /// The written progress text of the current mission,
  /// can be a percentage or a 0/10
  final String progressLabel;

  Badge({
    required this.badgeType,
    required this.title,
    this.imageUrl,
    this.progressValue,
    this.totalProgressValue,
    this.progressLabel = "",
  });

  factory Badge.fromJson(Map<String, dynamic> json) {
    return Badge(
      badgeType: json['badge'],
      title: json['title'],
      imageUrl: json['icon_url'],
      progressValue: json['progress'],
      totalProgressValue: json['total'],
      progressLabel: json['progress_label'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'badge': badgeType,
      'title': title,
      'icon_url': imageUrl,
      'progress': progressValue,
      'total': totalProgressValue,
      'progress_label': progressLabel,
    };
  }

  @override
  String toString() {
    return 'Badge{badgeType: $badgeType, title: $title, imageUrl: $imageUrl, progressValue: $progressValue, totalProgressValue: $totalProgressValue, progressLabel: $progressLabel}';
  }
}
