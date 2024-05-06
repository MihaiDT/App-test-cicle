import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/product_category.dart';

class InfoDropdownResultController extends GetxController {
  List<ProductCategory> get productCategories =>
      appController.productCategory.value ?? [];
}
