import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';

class InviteFriendController extends GetxController {
  int get coinAmount => appController.settings.value?.invitationCodeCoins ?? 50;

  String get referralCode => appController.user.value?.mgmCode ?? '';

  int get coinsCollected => appController.user.value?.coinsCollected ?? 0;

  Future<void> shareCode() async {
    String text =
        "Ciao! Non hai ancora scaricato l’app My Lines? E' molto più di un calendario mestruale! Inserisci il mio codice amico in fase di registrazione per ottenere già 50 coins!\n";

    if (appController.settings.value?.iosStoreUrl?.isNotEmpty ?? false) {
      text +=
          "\nScarica l'app iOS al link: ${appController.settings.value?.iosStoreUrl}";
    }
    if (appController.settings.value?.androidStoreUrl?.isNotEmpty ?? false) {
      text +=
          "\nScarica l'app Android al link: ${appController.settings.value?.androidStoreUrl}";
    }
    text += "\nCODICE AMICO: $referralCode";
    await FlutterShare.share(
      title: 'Condividi il codice amico',
      text: text,
    );
  }
}
