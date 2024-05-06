class Badge {
  final String badgeType;
  final String title;
  final String? iconUrl;

  /// The current progress of the current mission
  final int? progressValue;

  /// The total steps of the current mission
  final int? totalProgressValue;

  /// The written progress text of the current mission,
  /// can be a percentage or a 0/10
  final String progressLabel;

  final String description;

  Badge({
    required this.badgeType,
    required this.title,
    this.iconUrl,
    this.progressValue,
    this.totalProgressValue,
    this.progressLabel = "",
    this.description = "",
  });

  factory Badge.fromJson(Map<String, dynamic> json) {
    return Badge(
      badgeType: json['badge'],
      title: json['title'],
      iconUrl: json['icon_url'],
      progressValue: json['progress'],
      totalProgressValue: json['total'],
      progressLabel: json['progress_label'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'badge': badgeType,
      'title': title,
      'icon_url': iconUrl,
      'progress': progressValue,
      'total': totalProgressValue,
      'progress_label': progressLabel,
      'description': description,
    };
  }

  @override
  String toString() {
    return 'Badge{badgeType: $badgeType, title: $title, imageUrl: $iconUrl, progressValue: $progressValue, totalProgressValue: $totalProgressValue, progressLabel: $progressLabel, description: $description}';
  }
}
