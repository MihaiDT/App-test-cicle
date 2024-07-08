import 'package:get/get.dart';
import 'package:lines/repository/badges_service.dart';

class YoutCoinsController extends GetxController {
  final RxBool isLoading = false.obs;

  YoutCoinsController() {
    _fetchWalletTransactions();
  }

  Future<void> _fetchWalletTransactions() async {
    isLoading.value = true;
    await BadgesService.walletTransactions;
    isLoading.value = true;
  }
}
