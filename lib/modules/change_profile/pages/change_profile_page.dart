import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/change_profile/widget/customize_cherry.dart';
import 'package:lines/modules/change_profile/widget/your_information_section.dart';
import 'package:lines/modules/change_profile/widget/your_interest_section.dart';
import 'package:lines/modules/change_profile/widget/your_menses_section.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

class ChangeProfilePage extends StatelessWidget {
  const ChangeProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: const TransparentAppBar(
        title: TitleSmall(
          "MODIFICA PROFILO",
          color: ThemeColor.darkBlue,
        ),
        backButtonColor: ThemeColor.darkBlue,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ThemeSizedBox.height12,
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ThemeSize.paddingSmall,
              ),
              child: CustomizeCherry(),
            ),
            ThemeSizedBox.height36,
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ThemeSize.paddingSmall,
              ),
              child: YourInformationSection(),
            ),
            ThemeSizedBox.height32,
            _divider,
            ThemeSizedBox.height32,
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ThemeSize.paddingSmall,
              ),
              child: YourMensesSection(),
            ),
            ThemeSizedBox.height32,
            _divider,
            ThemeSizedBox.height32,
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ThemeSize.paddingSmall,
              ),
              child: YourInterestSection(),
            ),
            ThemeSizedBox.height32,
          ],
        ),
      ),
    );
  }

  Widget get _divider => const Divider(
        color: ThemeColor.lightGrey,
        thickness: 1,
        indent: ThemeSize.paddingMedium,
        endIndent: ThemeSize.paddingMedium,
      );
}
