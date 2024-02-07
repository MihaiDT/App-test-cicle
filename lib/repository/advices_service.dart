import 'package:dio/dio.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/advices_grouped_by_category.dart';
import '../core/utils/response_handler.dart';

class AdvicesService {
  static Future<void> fetchArticles() async {
    appController.advicesCategories.responseHandler = ResponseHandler.pending();
    try {
      final response = await dio.get(
        "/articles",
      );
      _saveAdvicesCategories(response);
    } catch (e) {
      appController.advicesCategories.responseHandler =
          ResponseHandler.failed();
      log.logError(e);
    }
  }

  static void _saveAdvicesCategories(Response response) {
    appController.advicesCategories.responseHandler =
        ResponseHandler.successful(
      content: AdvicesGroupedByCategory.fromJson(
        response.data,
      ),
    );
  }
}
