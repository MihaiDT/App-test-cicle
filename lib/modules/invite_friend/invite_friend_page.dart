import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/invite_friend/invite_friend_controller.dart';
import 'package:lines/modules/invite_friend/widgets/invite_friend_code.dart';
import 'package:lines/modules/invite_friend/widgets/invite_friend_friends_and_coins.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/widgets/coin/app_coin.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class InviteFriendPage extends GetView<InviteFriendController> {
  const InviteFriendPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundColor: Colors.white,
      appBar: const TransparentAppBar(
        backButtonColor: ThemeColor.darkBlue,
        title: TitleMedium(
          'INVITA UN AMICO',
          color: ThemeColor.darkBlue,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: BottomWidgetLayout(
          bottomWidget: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeSize.paddingSmall,
            ),
            child: PrimaryButton(
              onPressed: () async {
                await controller.shareCode();
              },
              child: const TitleLarge(
                "CONDIVIDI CODICE",
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeSize.paddingSmall,
            ),
            child: Column(
              children: [
                ThemeSizedBox.height32,
                Image.asset(
                  ThemeImage.friendship,
                  height: 206,
                ),
                ThemeSizedBox.height36,
                InviteFriendCode(
                  code: controller.referralCode,
                ),
                ThemeSizedBox.height16,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ThemeSize.paddingLarge,
                  ),
                  child: BodyMedium(
                    "Condividi il tuo codice di invito. Otterrete entrambi ${controller.coinAmount} Coins a seguito della registrazione in app.",
                    textAlign: TextAlign.center,
                    color: ThemeColor.darkBlue,
                  ),
                ),
                ThemeSizedBox.height16,
                AppCoin(
                  coinAmount: controller.coinAmount,
                ),
                ThemeSizedBox.height32,
                SizedBox(
                  height: Get.height * 0.125,
                  child: Obx(() {
                    final friendsAmount =
                        appController.user.value?.friendsInvited ?? 0;

                    return InviteFriendFriendsAndCoins(
                      friendsAmount: friendsAmount,
                      coinsCollected: controller.coinAmount * friendsAmount,
                    );
                  }),
                ),
                ThemeSizedBox.height8,
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BodySmall(
                      "Puoi guadagnare Coins per un massimo di",
                      color: ThemeColor.darkBlue,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    TitleMedium(
                      "5 amici",
                      color: ThemeColor.darkBlue,
                    ),
                  ],
                ),
                ThemeSizedBox.height32,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
