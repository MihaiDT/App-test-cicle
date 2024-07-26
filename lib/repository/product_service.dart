import 'package:dio/dio.dart';
import 'package:lines/core/error/error_manager.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/current_missions_for_product.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/data/models/product_category.dart';
import 'package:lines/data/models/uploaded_product.dart';

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
    appController.missions.responseHandler = ResponseHandler.pending(
      content: appController.missions.value,
    );
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

  static Future<void> loadCode(String code, int? missionId) async {
    appController.uploadedProduct.responseHandler = ResponseHandler.pending();
    try {
      final response = await dio.post(
        "/missions/upload_code",
        data: {
          "code": code,
          "mission_id": missionId,
        },
      );
      _saveUploadedProduct(response);
    } catch (e, s) {
      appController.uploadedProduct.responseHandler = ResponseHandler.failed(
        errorType: ErrorManager.checkError(e),
      );
      log.logApiException(e, s);
    }
  }

  static Future<void> findMissionByCode(String productCode) async {
    appController.currentMissionsForProduct.responseHandler = ResponseHandler.pending();
    try {
      final response = await dio.post(
        "/missions/find_missions_by_code",
        data: {
          "code": productCode,
        },
      );
      _saveCurrentMissionsForProduct(response);
    } catch (e, s) {
      appController.currentMissionsForProduct.responseHandler = ResponseHandler.failed(
        errorType: ErrorManager.checkError(e),
      );
      log.logApiException(e, s);
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

  static void _saveUploadedProduct(Response response) {
    appController.uploadedProduct.responseHandler = ResponseHandler.successful(
      content: UploadedProduct.fromJson(response.data),
    );
  }

  static void _saveCurrentMissionsForProduct(Response response) {
    final CurrentMissionsForProduct currentMissionsForProduct =
        CurrentMissionsForProduct.fromJson(response.data);

    appController.currentMissionsForProduct.responseHandler =
        ResponseHandler.successful(
      content: currentMissionsForProduct,
    );
  }
}
