import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/enums/background_type.dart';
import 'package:lines/modules/login/login_controller.dart';
import 'package:lines/modules/register/section/divider_section.dart';
import 'package:lines/modules/register/widget/link_account_widget.dart';
import 'package:lines/repository/parameters_class/registration_provider.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/primary_loading_button.dart';
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
          backgroundColor: Colors.white,
          appBar: const TransparentAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backButtonColor: ThemeColor.darkBlue,
          ),
          body: ListView(
            padding: EdgeInsets.only(
              left: ThemeSize.paddingLarge,
              right: ThemeSize.paddingLarge,
              top: MediaQuery.of(context).padding.top * 1.5,
            ),
            children: [
              ThemeSizedBox.height32,
              const DisplayMedium(
                "Ci siamo, accedi",
                textAlign: TextAlign.center,
                color: ThemeColor.primary,
              ),
              ThemeSizedBox.height16,
              const HeadlineMedium(
                "Utilizza la modalità di accesso\n scelta in fase di registrazione.",
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w700,
                color: ThemeColor.darkBlue,
              ),
              ThemeSizedBox.height48,
              const TitleLarge(
                "SE TI SEI REGISTRATO CON I SOCIAL\n CLICCA QUI",
                textAlign: TextAlign.center,
                color: ThemeColor.brightPink,
              ),
              ThemeSizedBox.height16,
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
              const DividerSection(
                color: ThemeColor.brightPink,
              ),
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
                  controller.emailValue.value = text;
                  FocusScope.of(context)
                      .requestFocus(controller.passwordFocusNode);
                },
                focusNode: controller.emailFocusNode,
                backgroundType: BackgroundType.light,
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
                    backgroundType: BackgroundType.light,
                  );
                },
              ),
              ThemeSizedBox.height8,
              InkWell(
                onTap: () {
                  controller.onForgotPasswordTap(context);
                },
                child:  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const TitleMedium(
                    "PASSWORD DIMENTICATA?",
                    textAlign: TextAlign.center,
                    underline: true,
                  ).applyShaders(context),
                ),
              ),
              ThemeSizedBox.height24,
              PrimaryLoadingButton(
                isLoading: controller.isButtonPending.value,
                onPressed: controller.canProceed.value
                    ? controller.onButtonPressed
                    : null,
                child: const TitleLarge(
                  "AVANTI",
                  letterSpacing: 2,
                ),
              ),
              ThemeSizedBox.height8,
              InkWell(
                onTap: () => Get.offAndToNamed(
                  Routes.register,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TitleMedium(
                        "Non hai un account Lines?",
                      ).applyShaders(context),
                      ThemeSizedBox.width4,
                      const TitleMedium(
                        "REGISTRATI",
                        letterSpacing: 1.5,
                        underline: true,
                      ).applyShaders(context),
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
