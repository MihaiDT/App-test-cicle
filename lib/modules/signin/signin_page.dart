import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';
import 'package:lines/widgets/forms/input_text_field.dart';
import 'package:lines/widgets/layouts/app_scaffold_padding.dart';

import '../../core/app_theme.dart';
import '../../widgets/layouts/app_scaffold_page.dart';
import '../../widgets/layouts/scrollable_appbar.dart';
import 'signin_controller.dart';

class SigninPage extends GetView<SigninController> {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return AppScaffoldPage(
      appBar: ScrollableAppBar(
        forceElevation: true,
        showBackBtn: true,
        scrollController: scrollController,
      ),
      backgroundImage: ThemeDecoration.images.bgDark,
      extendBodyBehindAppBar: true, // Serve per mantenere l'appbar trasparente
      scrollController: scrollController,
      body: _body(context),
    );
  }

  Widget _appleBtn() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(60),
        ),
        height: 60,
        width: 60,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: SizedBox(
              height: 24,
              width: 24,
              child: Image.asset(
                ThemeImage.apple,
                height: 24,
                width: 24,
              ),
            ),
          ),
        ));
  }

  Widget _body(BuildContext context) {
    return AppScaffoldPadding(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: ThemeSize.heightSafeAreaTop +
                ScrollableAppBar.scrollOffset -
                24,
          ),
          _logo(),
          ThemeSizedBox.height16,
          const DisplayMedium(
            "Crea il tuo account",
            textAlign: TextAlign.center,
          ),
          ThemeSizedBox.height16,
          const HeadlineMedium.boldRegular(
            "Registrati per iniziare\nla tua esperienza in MyLines",
            textAlign: TextAlign.center,
          ),
          ThemeSizedBox.height32,
          _social(),
          ThemeSizedBox.height32,
          _or(),
          ThemeSizedBox.height24,
          ..._form(),
        ],
      ),
    );
  }

  Widget _facebookBtn() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(60),
        ),
        height: 60,
        width: 60,
        child: Center(
          child: SizedBox(
            height: 24,
            width: 24,
            child: Image.asset(
              ThemeImage.facebook,
              height: 24,
              width: 24,
            ),
          ),
        ));
  }

  List<Widget> _form() {
    return [
      InputTextField(
        label: "EMAIL",
        keyboardType: TextInputType.emailAddress,
        placeholder: 'Inserisci la tua email',
        textEditingController: TextEditingController(),
        textCapitalization: TextCapitalization.none,
      ),
      ThemeSizedBox.height24,
      Obx(
        () => InputTextField(
          label: "PASSWORD",
          keyboardType: TextInputType.emailAddress,
          placeholder: 'Inserisci la tua password',
          textEditingController: TextEditingController(),
          textCapitalization: TextCapitalization.none,
          isPassword: true,
          obscureText: controller.obscurePassword,
          onTapTogglePassword: () => controller.onTapTogglePassword(),
        ),
      ),
      ThemeSizedBox.height40,
      const Spacer(),
      SecondaryButton(
        text: "AVANTI",
        onPressed: () {},
      ),
      ThemeSizedBox.height16,
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const HeadlineMedium.boldRegular(
            "Hai un account?",
          ),
          ThemeSizedBox.width4,
          const TitleMedium(
            "ACCEDI",
            underline: true,
          ),
        ],
      ),
    ];
  }

  Widget _googleBtn() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(60),
      ),
      height: 60,
      width: 60,
      child: Center(
        child: SizedBox(
          height: 24,
          width: 24,
          child: Image.asset(
            ThemeImage.google,
            height: 24,
            width: 24,
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return SizedBox(
      height: 80,
      width: 80,
      child: SvgPicture.asset(
        ThemeIcon.logo,
        fit: BoxFit.scaleDown,
      ),
    );
  }

  Widget _or() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.white,
          height: 1,
          width: 100,
        ),
        ThemeSizedBox.width24,
        const HeadlineMedium.boldRegular(
          "OPPURE",
        ),
        ThemeSizedBox.width24,
        Container(
          color: Colors.white,
          height: 1,
          width: 100,
        ),
      ],
    );
  }

  Widget _social() {
    return Column(children: [
      const HeadlineMedium.boldRegular(
        "USA I TUOI SOCIAL",
      ),
      ThemeSizedBox.height24,
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _facebookBtn(),
          ThemeSizedBox.width40,
          _googleBtn(),
          ThemeSizedBox.width40,
          _appleBtn(),
        ],
      ),
    ]);
  }
}
