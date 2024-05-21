import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/login/login_controller.dart';
import 'package:lines/modules/register/section/divider_section.dart';
import 'package:lines/modules/register/widget/link_account_widget.dart';
import 'package:lines/repository/parameters_class/registration_provider.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/secondary_loading_button.dart';
import 'package:lines/widgets/forms/input_text_field.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return AppScaffoldPage(
          extendBodyBehindAppBar: true,
          backgroundImage: ThemeDecoration.images.bgDark,
          appBar: const TransparentAppBar(),
          body: ListView(
            padding: EdgeInsets.only(
              left: ThemeSize.paddingLarge,
              right: ThemeSize.paddingLarge,
              top: MediaQuery.of(context).padding.top * 1.5,
            ),
            children: [
              SvgPicture.asset(
                ThemeIcon.logo,
                height: 85,
                width: 70,
              ),
              ThemeSizedBox.height16,
              const DisplayMedium(
                "Accedi a My Lines",
                textAlign: TextAlign.center,
              ),
              ThemeSizedBox.height16,
              const BodyMedium(
                "Inserisci username e password se hai già un account Lines creato in app o sul sito Lines.it",
                textAlign: TextAlign.center,
              ),
              ThemeSizedBox.height32,
              const TitleLarge(
                "USA I TUOI SOCIAL",
                textAlign: TextAlign.center,
              ),
              ThemeSizedBox.height24,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LinkAccountWidget(
                    imagePath: ThemeImage.facebook,
                    onTap: () => controller.socialLogin(
                      RegistrationProvider.facebook,
                    ),
                  ),
                  ThemeSizedBox.width40,
                  LinkAccountWidget(
                    imagePath: ThemeImage.google,
                    onTap: () => controller.socialLogin(
                      RegistrationProvider.google,
                    ),
                  ),
                  if (Platform.isIOS) ...[
                    ThemeSizedBox.width40,
                    LinkAccountWidget(
                      imagePath: ThemeImage.apple,
                      onTap: () => controller.socialLogin(
                        RegistrationProvider.apple,
                      ),
                    ),
                  ],
                ],
              ),
              ThemeSizedBox.height32,
              const DividerSection(),
              ThemeSizedBox.height32,
              InputTextField(
                label: "EMAIL",
                placeholder: 'Inserisci la tua email',
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                textEditingController: controller.emailController,
                onChanged: (text) {
                  controller.emailValue.value = text;
                },
                onEditingComplete: controller.isEmailValid,
                onSubmitted: (text) {
                  FocusScope.of(context)
                      .requestFocus(controller.passwordFocusNode);
                },
                focusNode: controller.emailFocusNode,
              ),
              ThemeSizedBox.height24,
              Obx(
                () {
                  return InputTextField(
                    label: "Password",
                    placeholder: 'Inserisci la password',
                    textCapitalization: TextCapitalization.none,
                    textEditingController: controller.passwordController,
                    isPassword: true,
                    obscureText: controller.hidePassword.value,
                    onTapTogglePassword: () {
                      controller.hidePassword.value =
                          !controller.hidePassword.value;
                    },
                    onSubmitted: (_) {
                      FocusScope.of(context).unfocus();
                    },
                    focusNode: controller.passwordFocusNode,
                  );
                },
              ),
              ThemeSizedBox.height16,
              GestureDetector(
                onTap: () {
                  controller.onForgotPasswordTap(context);
                },
                child: const TitleMedium(
                  "PASSWORD DIMENTICATA?",
                  textAlign: TextAlign.center,
                  underline: true,
                ),
              ),
              ThemeSizedBox.height32,
              SecondaryLoadingButton(
                isLoading: controller.isButtonPending.value,
                onPressed: controller.canProceed.value
                    ? controller.onButtonPressed
                    : null,
                child: const TitleLarge(
                  "AVANTI",
                ).applyShaders(context),
              ),
              ThemeSizedBox.height8,
              GestureDetector(
                onTap: () {
                  Get.offAndToNamed(
                    Routes.register,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TitleMedium(
                        "Non hai un account?",
                      ),
                      ThemeSizedBox.width4,
                      const TitleMedium(
                        "REGISTRATI",
                        underline: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
