import 'package:lines/data/models/product.dart';

class Mission {
  final String code;
  final int completeCounter;
  final String? disclaimer;
  final String title;

  /// Description of the mission used in the detail page
  final String description;
  final String? description2;

  /// Description of the mission used in the card
  final String? shortDescription;
  final String? regolamento;
  final String? prizeImage;
  final String? prizeDescription;
  final String? endAt;
  final int id;
  final String imageUrl;
  final int totalCounter;

  final List<Product> products;
  final List<Product> loadedProducts;

  Mission({
    required this.code,
    required this.completeCounter,
    required this.title,
    this.disclaimer = '',
    required this.description,
    this.description2 = "",
    this.shortDescription = "",
    this.regolamento,
    this.prizeImage,
    this.prizeDescription,
    this.endAt = "",
    required this.id,
    required this.imageUrl,
    required this.totalCounter,
    required this.products,
    required this.loadedProducts,
  });

  factory Mission.fromJson(Map<String, dynamic> json) {
    return Mission(
      code: json['code'],
      completeCounter: json['completed_counter'],
      title: json['title'],
      description: json['description'],
      description2: json['description_2'],
      shortDescription: json['short_description'],
      disclaimer: json['concorso_description'],
      regolamento: json['regolamento'],
      prizeImage: json['prize_image'],
      prizeDescription: json['prize_description'],
      endAt: json['end_at'],
      id: json['id'],
      imageUrl: json['image_url'] ?? '',
      totalCounter: json['total_counter'],
      products: List<Product>.from(
        json['products'].map(
          (product) => Product.fromJson(product),
        ),
      ),
      loadedProducts: List<Product>.from(
        json["uploaded_products"].map(
          (product) => Product.fromJson(product),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'completed_counter': completeCounter,
      'title': title,
      'description': description,
      'description_2': description2,
      'short_description': shortDescription,
      'disclaimber': disclaimer,
      'id': id,
      'image_url': imageUrl,
      'is_completed': isCompleted,
      'total_counter': totalCounter,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }

  @override
  String toString() =>
      'Mission(code: $code, completed_counter: $completeCounter, title: $title, description: $description,description2: $description2,shortDescription: $shortDescription, id: $id, image_url: $imageUrl, is_completed: $isCompleted, total_counter: $totalCounter, products: $products)';

  bool get isCompleted => loadedProducts.length >= totalCounter;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Mission &&
        other.code == code &&
        other.completeCounter == completeCounter &&
        other.disclaimer == disclaimer &&
        other.title == title &&
        other.description == description &&
        other.description2 == description2 &&
        other.shortDescription == shortDescription &&
        other.regolamento == regolamento &&
        other.prizeImage == prizeImage &&
        other.prizeDescription == prizeDescription &&
        other.endAt == endAt &&
        other.id == id &&
        other.imageUrl == imageUrl &&
        other.totalCounter == totalCounter;
  }
}
