import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import 'package:get/get.dart';
import "package:lines/core/app_theme.dart";
import "package:lines/modules/register/register_controller.dart";
import "package:lines/modules/register/section/divider_section.dart";
import "package:lines/modules/register/widget/link_account_widget.dart";
import "package:lines/routes/routes.dart";
import "package:lines/widgets/appbar/transparent_app_bar.dart";
import "package:lines/widgets/buttons/secondary_loading_button.dart";
import "package:lines/widgets/forms/input_text_field.dart";
import "package:lines/widgets/layouts/app_scaffold_page.dart";
import "package:lines/widgets/layouts/bottom_widget_layout.dart";

class RegisterAndLoginPage extends GetView<RegisterAndLoginController> {
  const RegisterAndLoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                Obx(
                  () => SecondaryLoadingButton(
                    isLoading: controller.isButtonPending.value,
                    onPressed: controller.onButtonPressed,
                    child: const TitleLarge(
                      "AVANTI",
                    ).applyShaders(context),
                  ),
                ),
                ThemeSizedBox.height16,
                controller.isLoginPage
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TitleMedium(
                            "Non hai un account?",
                          ),
                          ThemeSizedBox.width4,
                          GestureDetector(
                            onTap: () {
                              controller.isLoginPage = !controller.isLoginPage;
                              Get.offAndToNamed(
                                Routes.registerAndLogin,
                              );
                            },
                            child: const TitleMedium(
                              "REGISTRATI",
                              underline: true,
                            ),
                          )
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TitleMedium(
                            "Hai un account?",
                          ),
                          ThemeSizedBox.width4,
                          GestureDetector(
                            onTap: () {
                              controller.isLoginPage = !controller.isLoginPage;
                              Get.offAndToNamed(
                                Routes.registerAndLogin,
                              );
                            },
                            child: const TitleMedium(
                              "ACCEDI",
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
              DisplayMedium(
                controller.isLoginPage
                    ? "Accedi a myDrop"
                    : "Crea il tuo account",
              ),
              ThemeSizedBox.height16,
              BodyMedium(
                controller.isLoginPage
                    ? "Inserisci username e password\n per entrare nel tuo account."
                    : "Registrati per iniziare\n la tua esperienza in myDrop",
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
                    onPressed: () {},
                  ),
                  ThemeSizedBox.width40,
                  LinkAccountWidget(
                    imagePath: ThemeImage.google,
                    onPressed: () {},
                  ),
                  if (Platform.isIOS) ...[
                    ThemeSizedBox.width40,
                    LinkAccountWidget(
                      imagePath: ThemeImage.apple,
                      onPressed: () {
                        controller.appleSignIn();
                      },
                    ),
                  ]
                ],
              ),
              ThemeSizedBox.height32,
              const DividerSection(),
              ThemeSizedBox.height32,
              Obx(
                () => InputTextField(
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
              ),
              ThemeSizedBox.height24,
              Obx(
                () => InputTextField(
                  label: "Password",
                  placeholder: 'Inserisci la password',
                  textCapitalization: TextCapitalization.none,
                  textEditingController: controller.passwordController,
                  isPassword: true,
                  obscureText: controller.hidePassword,
                  onTapTogglePassword: () {
                    controller.hidePassword = !controller.hidePassword;
                  },
                ),
              ),
              ThemeSizedBox.height16,
              TitleMedium(
                controller.isLoginPage ? "PASSWORD DIMENTICATA?" : "",
                textAlign: TextAlign.center,
                underline: true,
              ),
              ThemeSizedBox.height16,
            ],
          ),
        ),
      ),
    );
  }
}
