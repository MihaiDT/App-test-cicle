import 'package:lines/data/models/info_product.dart';

class InfoGroup {
  final String title;
  final List<InfoProduct> products;

  InfoGroup({
    required this.title,
    required this.products,
  });
}
