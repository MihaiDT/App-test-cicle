import 'package:dio/dio.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/data/models/product_category.dart';

class ProductService {
  static Future<void> get products async {
    appController.productCategory.responseHandler = ResponseHandler.pending();
    try {
      final response = await dio.get(
        "/missions/products",
      );
      _saveProducts(response);
    } catch (e) {
      appController.productCategory.responseHandler = ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  static Future<void> get mission async {
    appController.missions.responseHandler = ResponseHandler.pending();
    try {
      final response = await dio.get(
        "/missions",
      );
      _saveMissions(response);
    } catch (e) {
      appController.missions.responseHandler = ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  static void _saveProducts(Response response) {
    List<dynamic> periodsData = response.data["products"];
    List<ProductCategory> periodsStats = periodsData
        .map((category) => ProductCategory.fromJson(category))
        .toList();

    appController.productCategory.responseHandler = ResponseHandler.successful(
      content: periodsStats,
    );
  }

  static void _saveMissions(Response response) {
    List<dynamic> responseData = response.data["missions"];
    List<Mission> missions =
        responseData.map((category) => Mission.fromJson(category)).toList();

    appController.missions.responseHandler = ResponseHandler.successful(
      content: missions,
    );
  }
}
