class Product {
  final String? imageUrl;
  final bool isNight;
  final String name;
  final int points;

  Product({
    this.imageUrl,
    this.isNight = false,
    required this.name,
    required this.points,
  });
}
