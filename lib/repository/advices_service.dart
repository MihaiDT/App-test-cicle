import 'package:dio/dio.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/advices_article.dart';
import 'package:lines/data/models/advices_grouped_by_category.dart';

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

  static Future<void> fetchSuggestedArticles() async {
    try {
      appController.suggestedAdvicesArticle.responseHandler =
          ResponseHandler.pending();
      final response = await dio.get(
        "/articles/suggested",
      );
      _saveSuggestedArticle(response);
    } catch (e) {
      appController.suggestedAdvicesArticle.responseHandler =
          ResponseHandler.failed();
      log.logError(e);
    }
  }

  static Future<void> addArticleToFav(AdvicesArticle article) async {
    try {
      await dio.post(
        "/articles/${article.id}/add_to_favs",
      );
    } catch (e) {
      log.logError(e);
    }
  }

  static Future<void> removeArticleFromFav(AdvicesArticle article) async {
    try {
      await dio.post(
        "/articles/${article.id}/remove_from_favs",
      );
    } catch (e) {
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

  static void _saveSuggestedArticle(Response response) {
    appController.suggestedAdvicesArticle.responseHandler =
        ResponseHandler.successful(
      content: response.data["suggested"]
          .map<AdvicesArticle>(
            (article) => AdvicesArticle.fromJson(article),
          )
          .toList(),
    );
  }
}
