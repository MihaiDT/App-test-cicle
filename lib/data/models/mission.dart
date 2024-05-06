import 'package:lines/data/models/product.dart';

class Mission {
  final String code;
  final int completeCounter;
  final String title;
  final String description;

  final int id;
  final String imageUrl;
  final bool isCompleted;

  final int totalCounter;

  final List<Product> products;

  Mission({
    required this.code,
    required this.completeCounter,
    required this.title,
    required this.description,
    required this.id,
    required this.imageUrl,
    required this.isCompleted,
    required this.totalCounter,
    required this.products,
  });

  factory Mission.fromJson(Map<String, dynamic> json) {
    return Mission(
      code: json['code'],
      completeCounter: json['completed_counter'],
      title: json['title'],
      description: json['description'],
      id: json['id'],
      imageUrl: json['image_url'],
      isCompleted: json['is_completed'],
      totalCounter: json['total_counter'],
      products: List<Product>.from(
        json['products'].map(
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
      'id': id,
      'image_url': imageUrl,
      'is_completed': isCompleted,
      'total_counter': totalCounter,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }

  @override
  String toString() =>
      'Mission(code: $code, completed_counter: $completeCounter, title: $title, description: $description, id: $id, image_url: $imageUrl, is_completed: $isCompleted, total_counter: $totalCounter, products: $products)';
}
