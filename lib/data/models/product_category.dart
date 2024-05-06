import 'package:lines/data/models/product.dart';

class ProductCategory {
  final String category;
  final List<Product> products;

  ProductCategory({
    required this.category,
    required this.products,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      category: json['category'],
      products: json['products']
              .map<Product>((product) => Product.fromJson(product))
              .toList() ??
          <Product>[],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }

  @override
  String toString() =>
      'ProductCategory(category: $category, products: $products)';
}
