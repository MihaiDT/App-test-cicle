import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";
import "package:lines/core/app_theme.dart";
import "package:lines/core/utils/singletons.dart";
import "package:lines/modules/register/register_controller.dart";
import "package:lines/modules/register/section/divider_section.dart";
import "package:lines/modules/register/widget/link_account_widget.dart";
import "package:lines/routes/routes.dart";
import "package:lines/widgets/appbar/transparent_app_bar.dart";
import "package:lines/widgets/buttons/secondary_button.dart";
import "package:lines/widgets/forms/input_text_field.dart";
import "package:lines/widgets/layouts/app_scaffold_page.dart";
import "package:lines/widgets/layouts/bottom_widget_layout.dart";

import "../../core/theme/text_wrapper.dart";

class RegisterAndLoginPageArguments {
  final bool? isLoginPage;

  RegisterAndLoginPageArguments({
    required this.isLoginPage,
  });
}

class RegisterAndLoginPage extends StatelessWidget {
  RegisterAndLoginPage({
    super.key,
  });

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.put(RegisterAndLoginController());

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      extendBodyBehindAppBar: true,
      backgroundImage: ThemeDecoration.images.bgDark,
      appBar: const TransparentAppBar(),
      body: BottomWidgetLayout(
        scrollableAreaPadding: EdgeInsets.only(
          left: 32,
          right: 32,
          top: MediaQuery.sizeOf(context).height * 0.04,
        ),
        bottomWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SecondaryButton(
                text: "AVANTI",
                onPressed: () async {
                  if (controller.isLoginPage) {
                    await controller.loginUser();
                  } else {
                    /// Save in the state email and password values
                    appController.user?.value?.email = emailController.text;
                    appController.user?.value?.password = passwordController.text;
                    Get.toNamed(Routes.nameSurname);
                  }
                },
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
                              arguments: RegisterAndLoginPageArguments(
                                isLoginPage: false,
                              ),
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
                              arguments: RegisterAndLoginPageArguments(
                                isLoginPage: true,
                              ),
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
                ThemeSizedBox.width40,
                LinkAccountWidget(
                  imagePath: ThemeImage.apple,
                  onPressed: () {},
                ),
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
              textEditingController: TextEditingController(),
            ),
            ThemeSizedBox.height24,
            Obx(
              () {
                return InputTextField(
                  label: "Password",
                  placeholder: 'Inserisci la password',
                  textCapitalization: TextCapitalization.none,
                  textEditingController: passwordController,
                  isPassword: true,
                  obscureText: controller.hidePassword,
                  onTapTogglePassword: () {
                    controller.hidePassword = !controller.hidePassword;
                  },
                );
              },
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
    );
  }
}
