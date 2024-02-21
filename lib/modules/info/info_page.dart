import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/info/controller/info_controller.dart';
import 'package:lines/modules/info/widgets/info_widget.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/coin/coin_total.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

class InfoPage extends GetView<InfoController> {
  const InfoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundColor: Colors.white,
      appBar: const TransparentAppBar(
        backButtonColor: ThemeColor.darkBlue,
        title: TitleMedium(
          'INFO',
          color: ThemeColor.darkBlue,
        ),
        actions: [
          CoinTotal(
            totalCoins: 250,
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
        ),
        children: [
          ThemeSizedBox.height16,
          InfoWidget(
            text: 'Quanti coins valgono i prodotti?',
            onTap: () => Get.toNamed(
              Routes.infoDropdownResultsPage,
            ),
          ),
        ],
      ),
    );
  }
}
