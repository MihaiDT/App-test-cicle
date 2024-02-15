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
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

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
          body: SafeArea(
            child: BottomWidgetLayout(
              scrollableAreaPadding: const EdgeInsets.symmetric(
                horizontal: ThemeSize.paddingLarge,
              ),
              bottomWidget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SecondaryLoadingButton(
                      isLoading: controller.isButtonPending.value,
                      onPressed: controller.onButtonPressed,
                      child: const TitleLarge(
                        "AVANTI",
                      ).applyShaders(context),
                    ),
                    ThemeSizedBox.height16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TitleMedium(
                          "Non hai un account?",
                        ),
                        ThemeSizedBox.width4,
                        GestureDetector(
                          onTap: () {
                            Get.offAndToNamed(
                              Routes.register,
                            );
                          },
                          child: const TitleMedium(
                            "REGISTRATI",
                            underline: true,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              child: Column(
                children: [
                  SvgPicture.asset(
                    ThemeIcon.logo,
                    height: 85,
                    width: 70,
                  ),
                  ThemeSizedBox.height16,
                  const DisplayMedium(
                    "Accedi a myDrop",
                  ),
                  ThemeSizedBox.height16,
                  const BodyMedium(
                    "Inserisci username e password\n"
                    " per entrare nel tuo account.",
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
                      ]
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
                    onEditingComplete: controller.validateEmail,
                    hasError: controller.emailError.value.isNotEmpty,
                    errorMessage: controller.emailError.value,
                  ),
                  ThemeSizedBox.height24,
                  Obx(() {
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
                    );
                  }),
                  ThemeSizedBox.height16,
                  const TitleMedium(
                    "PASSWORD DIMENTICATA?",
                    textAlign: TextAlign.center,
                    underline: true,
                  ),
                  ThemeSizedBox.height16,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
