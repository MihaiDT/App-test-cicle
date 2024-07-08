import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/info/widgets/info_bottom_sheet.dart';
import 'package:lines/modules/info/widgets/info_what_are_coins_bottomsheet..dart';
import 'package:lines/modules/your_coins/widgets/activity_card.dart';
import 'package:lines/modules/your_coins/your_coins_controller.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/coin/coin_total.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:shimmer/shimmer.dart';

class YourCoinsPage extends GetView<YoutCoinsController> {
  const YourCoinsPage({
    super.key,
  });

  static const Color _dividerColor = Color(0x194b399c);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundColor: Colors.white,
      appBar: TransparentAppBar(
        backButtonColor: ThemeColor.darkBlue,
        title: const TitleMedium(
          "I TUOI COINS",
          color: ThemeColor.darkBlue,
        ),
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                constraints: BoxConstraints(maxHeight: Get.height * 0.85),
                context: context,
                isScrollControlled: true,
                builder: (_) => Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    color: Colors.white,
                  ),
                  child: const InfoBottomSheet(
                    child: InfoWhatAreCoinsBottomSheet(),
                  ),
                ),
              );
            },
            child: SvgPicture.asset(
              ThemeIcon.info,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
        ),
        child: ListView(
          children: [
            ThemeSizedBox.height12,
            Image.asset(
              ThemeImage.coinsColumns,
              height: 190,
            ),
            IgnorePointer(
              child: Center(
                child: CoinTotal.large(
                  totalCoins: appController.user.value?.coinsCollected ?? 0,
                ),
              ),
            ),
            ThemeSizedBox.height48,
            const Divider(
              color: _dividerColor,
            ),
            ThemeSizedBox.height24,
            const DisplayMedium(
              "Le tue attività",
              textAlign: TextAlign.center,
            ).applyShaders(context),
            ThemeSizedBox.height20,
            Obx(
              () => appController.walletTransactions.responseHandler.isSuccessful
                  ? ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final walletTransaction = appController.walletTransactions.value![index];

                        return ActivityCard(
                          formattedDate: walletTransaction.formattedDate,
                          title: walletTransaction.title,
                          coinAmount: walletTransaction.coins,
                          imagePath:
                              walletTransaction.imagePath != null ? "assets/${walletTransaction.imagePath}" : null,
                        );
                      },
                      separatorBuilder: (context, index) => ThemeSizedBox.height16,
                      itemCount: appController.walletTransactions.value!.length,
                    )
                  : _shimmer(),
            ),
            ThemeSizedBox.height90,
          ],
        ),
      ),
    );
  }

  Widget _shimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            height: 120,
            width: double.maxFinite,
          ),
          ThemeSizedBox.height12,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            height: 120,
            width: double.maxFinite,
          ),
          ThemeSizedBox.height12,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            height: 120,
            width: double.maxFinite,
          ),
        ],
      ),
    );
  }
}
