import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/badges_service.dart';

class WelcomeQuizOutroController extends GetxController {
  @override
  Future<void> onReady() async {
    await BadgesService.wallet;
    await AuthenticationService.fetchUser();
    super.onReady();
  }

  /// Return the coin amount for the current survey fetched from settings
  int get coinAmount => appController.settings.value?.welcomeSurveyCoins ?? 150;
}
