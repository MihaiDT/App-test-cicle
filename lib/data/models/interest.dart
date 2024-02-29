class Interest {
  final String name;
  final String id;

  Interest({
    required this.name,
    required this.id,
  });

  factory Interest.fromJson(Map<String, dynamic> json) {
    return Interest(
      name: json['name'],
      id: json['id'],
    );
  }

  factory Interest.toJson(Interest interest) {
    return Interest(
      name: interest.name,
      id: interest.id,
    );
  }
}
