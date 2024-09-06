import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import 'package:get/get.dart';
import "package:lines/core/app_theme.dart";
import "package:lines/modules/register/register_controller.dart";
import "package:lines/modules/register/section/divider_section.dart";
import "package:lines/modules/register/widget/link_account_widget.dart";
import "package:lines/repository/parameters_class/registration_provider.dart";
import "package:lines/routes/routes.dart";
import "package:lines/widgets/appbar/transparent_app_bar.dart";
import "package:lines/widgets/buttons/secondary_loading_button.dart";
import "package:lines/widgets/forms/input_text_field.dart";
import "package:lines/widgets/layouts/app_scaffold_page.dart";

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return AppScaffoldPage(
          extendBodyBehindAppBar: true,
          backgroundImage: ThemeDecoration.images.bgDark,
          appBar: const TransparentAppBar(
            showBackButton: false,
          ),
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
                "Crea il tuo account",
                textAlign: TextAlign.center,
              ),
              ThemeSizedBox.height16,
              const BodyMedium(
                "Registrati per iniziare la tua esperienza in My Lines.\n"
                "Se invece hai già un account Lines creato in app o sul sito Lines.it clicca su ACCEDI in basso",
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
                    onTap: () => controller.setRegistrationProvider(
                      RegistrationProvider.facebook,
                    ),
                  ),
                  ThemeSizedBox.width40,
                  LinkAccountWidget(
                    imagePath: ThemeImage.google,
                    onTap: () => controller.setRegistrationProvider(
                      RegistrationProvider.google,
                    ),
                  ),
                  if (Platform.isIOS) ...[
                    ThemeSizedBox.width40,
                    LinkAccountWidget(
                      imagePath: ThemeImage.apple,
                      onTap: () => controller.setRegistrationProvider(
                        RegistrationProvider.apple,
                      ),
                    ),
                  ],
                ],
              ),
              ThemeSizedBox.height32,
              const DividerSection(
                color: ThemeColor.whiteDark,
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
                onEditingComplete: controller.validateEmail,
                hasError: controller.emailError.value.isNotEmpty,
                errorMessage: controller.emailError.value,
                focusNode: controller.emailFocusNode,
                onSubmitted: (text) {
                  FocusScope.of(context)
                      .requestFocus(controller.passwordFocusNode);
                },
              ),
              ThemeSizedBox.height24,
              InputTextField(
                label: "Password",
                placeholder: 'Inserisci la password',
                textCapitalization: TextCapitalization.none,
                textEditingController: controller.passwordController,
                isPassword: true,
                obscureText: controller.hidePassword,
                onTapTogglePassword: () {
                  controller.hidePassword = !controller.hidePassword;
                },
                onSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                },
                focusNode: controller.passwordFocusNode,
              ),
              ThemeSizedBox.height32,
              SecondaryLoadingButton(
                isLoading: controller.isButtonPending.value,
                onPressed: controller.canProceed.value
                    ? () async {
                        await controller.onButtonPressed();
                      }
                    : null,
                child: const TitleLarge(
                  "AVANTI",
                  letterSpacing: 2,
                ).applyShaders(context),
              ),
              ThemeSizedBox.height8,
              InkWell(
                onTap: () {
                  Get.offAndToNamed(
                    Routes.login,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TitleMedium(
                        "Hai già un account Lines?",
                      ),
                      ThemeSizedBox.width4,
                      const TitleMedium(
                        "ACCEDI",
                        letterSpacing: 1.5,
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
