import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/product_category.dart';
import 'package:lines/repository/product_service.dart';

class InfoDropdownResultController extends GetxController {
  @override
  Future<void> onReady() async {
    super.onReady();
    if (!appController.productCategory.responseHandler.isSuccessful) {
      await ProductService.products;
    }
    ever(
      appController.productCategory.rxValue,
      (productCategory) {
        if (productCategory.isPending) {
          pageIsLoading.value = true;
        }
        if (productCategory.isSuccessful || productCategory.isFailed) {
          pageIsLoading.value = false;
        }
      },
    );
  }

  RxBool pageIsLoading = false.obs;

  List<ProductCategory> get productCategories =>
      appController.productCategory.value ?? [];
}
