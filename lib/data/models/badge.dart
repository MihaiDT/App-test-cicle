class Badge {
  final String name;
  final String description;
  final String? imageUrl;

  /// The progress value of the current mission value is a double
  final double? progressValue;

  /// The written progress text of the current mission,
  /// can be a percentage or a 0/10
  final String progressText;

  Badge({
    required this.name,
    required this.description,
    this.imageUrl,
    this.progressValue,
    this.progressText = "",
  });

  factory Badge.fromJson(Map<String, dynamic> json) {
    return Badge(
      name: json['name'],
      description: json['description'],
      imageUrl: json['imagePath'],
      progressValue: json['progress'],
      progressText: json['progressText'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'imagePath': imageUrl,
      'progress': progressValue,
      'progressText': progressText,
    };
  }
}
