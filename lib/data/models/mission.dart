import 'package:lines/data/models/product.dart';

class Mission {
  final String code;
  final int completeCounter;
  final String title;
  final String description;
  final String? description2;
  final String? regolamento;
  final String? prizeImage;
  final String? prizeDescription;
  final String? endAt;
  final int id;
  final String imageUrl;
  final bool isCompleted;

  final int totalCounter;

  final List<Product> products;
  final List<Product> loadedProducts;

  Mission({
    required this.code,
    required this.completeCounter,
    required this.title,
    required this.description,
    this.description2 = "",
    this.regolamento,
    this.prizeImage,
    this.prizeDescription,
    this.endAt = "",
    required this.id,
    required this.imageUrl,
    required this.isCompleted,
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
      regolamento: json['regolamento'],
      prizeImage: json['prize_image'],
      prizeDescription: json['prize_description'],
      endAt: json['end_at'],
      id: json['id'],
      imageUrl: json['image_url'],
      isCompleted: json['is_completed'],
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
      'id': id,
      'image_url': imageUrl,
      'is_completed': isCompleted,
      'total_counter': totalCounter,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }

  @override
  String toString() =>
      'Mission(code: $code, completed_counter: $completeCounter, title: $title, description: $description,description2: $description2,id: $id, image_url: $imageUrl, is_completed: $isCompleted, total_counter: $totalCounter, products: $products)';
}
