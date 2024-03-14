import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';

class InviteFriendController extends GetxController {
  String get referralCode => appController.user.value?.mgmCode ?? '';

  Future<void> shareCode() async {
    await FlutterShare.share(
      title: 'Condividi il codice amico',
      text: 'Ciao! Usa il mio codice amico per registrarti in app: ERKDEL56',
    );
  }
}
