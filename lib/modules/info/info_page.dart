import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/info/controller/info_controller.dart';
import 'package:lines/modules/info/widgets/info_how_do_missions_work_bottomsheet..dart';
import 'package:lines/modules/info/widgets/info_how_does_lucky_lines_work_bottomsheet.dart';
import 'package:lines/modules/info/widgets/info_how_to_get_coins_bottomsheet.dart';
import 'package:lines/modules/info/widgets/info_how_to_spend_coins_bottomsheet.dart';
import 'package:lines/modules/info/widgets/info_question.dart';
import 'package:lines/modules/info/widgets/info_the_code_is_illegible_bottomsheet.dart';
import 'package:lines/modules/info/widgets/info_what_are_coins_bottomsheet..dart';
import 'package:lines/modules/info/widgets/info_what_if_i_upload_bottomsheet..dart';
import 'package:lines/modules/info/widgets/info_where_to_find_the_code_bottomsheet..dart';
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
      appBar: TransparentAppBar(
        backButtonColor: ThemeColor.darkBlue,
        title: const TitleMedium(
          'INFO',
          color: ThemeColor.darkBlue,
        ),
        actions: [
          CoinTotal(
            totalCoins: controller.totalCoins,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
        ),
        children: [
          ThemeSizedBox.height16,
          InfoQuestion(
            text: "Cosa sono i coins?",
            onTap: () => controller.showBottomSheet(
              context,
              const InfoWhatAreCoinsBottomSheet(color: Colors.transparent),
            ),
          ),
          ThemeSizedBox.height16,
          InfoQuestion(
            text: "Come si ottengono i Coins?",
            onTap: () => controller.showBottomSheet(
              context,
              const InfoHowToGetCoinsBottomSheet(),
            ),
          ),
          ThemeSizedBox.height16,
          InfoQuestion(
            text: "Come posso spendere i Coins?",
            onTap: () => controller.showBottomSheet(
              context,
              const InfoHowToSpendCoinsBottomSheet(),
            ),
          ),
          ThemeSizedBox.height16,
          InfoQuestion(
            text: 'Quanti Coins valgono i prodotti?',
            onTap: () => Get.toNamed(
              Routes.infoDropdownResultsPage,
            ),
          ),
          ThemeSizedBox.height16,
          InfoQuestion(
            text: "Dove trovo il codice prodotto?",
            onTap: () => controller.showBottomSheet(
              context,
              const InfoWhereToFindTheCodeBottomSheet(),
            ),
          ),
          ThemeSizedBox.height16,
          InfoQuestion(
            text: "Come funzionano le missioni?",
            onTap: () => controller.showBottomSheet(
              context,
              const InfoHowDoMissionsWorkBottomSheet(),
            ),
          ),
          if (false) ...[
            ThemeSizedBox.height16,
            InfoQuestion(
              text: "Come funzionano i Lucky lines?",
              onTap: () => controller.showBottomSheet(
                context,
                const InfoHowDoesLuckyLinesWorkBottomSheet(),
              ),
            ),
          ],
          ThemeSizedBox.height16,
          InfoQuestion(
            text: "E se carico un codice prodotto di una missione?",
            onTap: () => controller.showBottomSheet(
              context,
              const InfoWhatIfIUploadBottomSheet(),
            ),
          ),
          ThemeSizedBox.height16,
          InfoQuestion(
            text: "Il codice sulla confezione è illeggibile",
            onTap: () => controller.showBottomSheet(
              context,
              const InfoTheCodeIsIllegibleBottomSheet(),
            ),
          ),
          ThemeSizedBox.height48,
        ],
      ),
    );
  }
}
