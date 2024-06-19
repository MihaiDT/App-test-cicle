class Product {
  final String? imageUrl;
  final bool isNight;
  final String name;
  final int points;
  final String category;

  Product({
    this.imageUrl,
    this.isNight = false,
    required this.name,
    required this.points,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      imageUrl: json['image_url'],
      isNight: json['sub_category'] == 'NOTTE',
      name: json['name'] ?? "",
      points: json['points'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'points': points,
      'category': category,
    };
  }

  @override
  String toString() {
    return 'Product(imageUrl: $imageUrl, isNight: $isNight, name: $name, points: $points, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.imageUrl == imageUrl &&
        other.isNight == isNight &&
        other.name == name &&
        other.points == points &&
        other.category == category;
  }
}
