import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";
import "package:lines/core/app_theme.dart";
import "package:lines/core/theme/theme_button_size.dart";
import "package:lines/modules/register/register_controller.dart";
import "package:lines/modules/register/section/divider_section.dart";
import "package:lines/modules/register/widget/link_account_widget.dart";
import "package:lines/routes/routes.dart";
import "package:lines/widgets/appbar/transparent_app_bar.dart";
import "package:lines/widgets/buttons/app_button.dart";
import "package:lines/widgets/buttons/secondary_button.dart";
import "package:lines/widgets/forms/input_text_field.dart";
import "package:lines/widgets/layouts/app_scaffold_padding.dart";
import "package:lines/widgets/layouts/app_scaffold_page.dart";

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
      body: AppScaffoldPadding(
        child: Column(
          children: [
            SvgPicture.asset(
              ThemeIcon.logo,
              height: 85,
              width: 70,
            ),
            ThemeSizedBox.height16,
            Text(
              controller.isLoginPage
                  ? "Accedi a myDrop"
                  : "Crea il tuo account",
              style: ThemeTextStyle.largeLight,
              textAlign: TextAlign.center,
            ),
            ThemeSizedBox.height16,
            Text(
              controller.isLoginPage
                  ? "Inserisci username e password\n per entrare nel tuo account."
                  : "Registrati per iniziare\n la tua esperienza in myDrop",
              style: ThemeTextStyle.calendarWeekDay,
              textAlign: TextAlign.center,
            ),
            ThemeSizedBox.height32,
            Text(
              "USA I TUOI SOCIAL",
              style: ThemeTextStyle.calendarMonth,
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
            Text(
              controller.isLoginPage ? "PASSWORD DIMENTICATA" : "",
              style: ThemeTextStyle.buttonSmall.copyWith(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PrimaryButton(
                    text: "Avanti",
                    onTap: () {
                      Get.toNamed(Routes.nameSurname);
                    },
                    filled: false,
                  ),
                  ThemeSizedBox.height16,
                  controller.isLoginPage
                      ? RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Non hai un account? ",
                            children: [
                              TextSpan(
                                text: "REGISTRATI",
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    controller.isLoginPage =
                                        !controller.isLoginPage;

                                    Get.offAndToNamed(
                                      Routes.registerAndLogin,
                                      arguments: RegisterAndLoginPageArguments(
                                        isLoginPage: false,
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        )
                      : RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Hai un account? ",
                            children: [
                              TextSpan(
                                text: "ACCEDI",
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    controller.isLoginPage =
                                        !controller.isLoginPage;

                                    Get.offAndToNamed(
                                      Routes.registerAndLogin,
                                      arguments: RegisterAndLoginPageArguments(
                                        isLoginPage: true,
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
