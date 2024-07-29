import 'dart:async';

import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_config.dart';
import 'package:app_links/app_links.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/app.dart';
import 'package:lines/core/helpers/dependency_injection_manager.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/utils/helpers.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/advices_article_detail_pair.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/firebase_options.dart';
import 'package:lines/flavors.dart';
import 'package:lines/repository/advices_service.dart';
import 'package:lines/repository/interceptor/dio_interceptor.dart';
import 'package:lines/repository/interceptor/dio_log_intercpetor.dart';
import 'package:lines/routes/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initApp();

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://fbfb4368c454bd92922315966f6e9e0c@o4506676620099584.ingest.us.sentry.io/4507391102484480';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = F.appFlavor == Flavor.dev ? 1.0 : 0.2;
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(const App()),
  );
}

Future<void> _initApp() async {
  await dependencyRegister(
    flavor: F.appFlavor ?? Flavor.dev,
  );
  _initNetwork();
  _initDeepLinking();
  _initAdjust();
  await _initFirebase();
}

void _initAdjust() {
  // if (!kDebugMode && F.appFlavor == Flavor.prod) {
  AdjustConfig config = AdjustConfig(
    't9i3xit2s1ds',
    AdjustEnvironment.production,
  );
  config.logLevel = AdjustLogLevel.verbose;
  Adjust.start(config);
  // }
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp(
    // name: Platform.isIOS ? 'lines-fed32' : null,
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void _initNetwork() {
  dio.interceptors.addAll(
    [
      DioErrorInterceptor(),
      DioInterceptor(
        dio: dio,
      ),
      DioLogInterceptor(),
    ],
  );

  logDebug('Dio inizializzato', tag: 'Network');
}

/// Manage deep linking
void _initDeepLinking() {
  final appLinks = AppLinks();
  appLinks.uriLinkStream.listen((uri) async {
    logDebug('Deep link: $uri', tag: 'DeepLinkDeepLinkDeepLinkDeepLink');

    if (uri.path.contains('/login')) {
      Get.offAndToNamed(Routes.login);
    } else if (uri.path.contains('/app/articoli')) {
      if (HiveManager.userId.isNotEmpty) {
        // Link articolo
        appController.hasUsedDeepLink.value = true;

        final id = uri.pathSegments.last;

        if (id.isNotEmpty) {
          await AdvicesService.fetchSingleArticle(id);

          /// Method to retrieve the correct article category from the one
          /// we have as response in AdvicesService.fetchSingleArticle
          AdvicesCategory? category;
          appController.advicesCategories.value?.categories.forEach(
            (key, value) {
              if (value.advicesCategory.categoryTitle ==
                  appController.singleArticle.value?.article.categoryName) {
                category = value.advicesCategory;
              }
            },
          );
          if (appController.singleArticle.value != null && category != null) {
            Get.toNamed(
              Routes.articleDetailPage,
              arguments: AdvicesDetailPair(
                article: appController.singleArticle.value!.article,
                category: category!,
              ),
            );
          }
        }
      }
    }
  });
}
