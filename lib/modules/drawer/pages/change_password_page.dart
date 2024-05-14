import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/drawer/controller/change_password_controller.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class ChangePasswordPage extends GetView<ChangePasswordController> {
  const ChangePasswordPage({
    super.key,
  });

  static const Color _textFieldFillColor = Color(0xfff7f3f8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TransparentAppBar(
        backButtonColor: ThemeColor.darkBlue,
        title: TitleMedium(
          "PASSWORD",
          color: ThemeColor.darkBlue,
        ),
      ),
      body: BottomWidgetLayout(
        bottomWidget: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ThemeSize.paddingSmall,
          ),
          child: PrimaryButton(
            child: const TitleLarge("SALVA"),
            onPressed: () {},
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ThemeSize.paddingSmall,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ThemeSizedBox.height20,
              const DisplayMedium(
                "Modifica password",
              ).applyShaders(context),
              ThemeSizedBox.height32,
              const LabelLarge(
                "NUOVA PASSWORD",
                color: ThemeColor.darkBlue,
              ),
              ThemeSizedBox.height8,
              TextField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                  labelText: "Inserisci password",
                  labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ThemeColor.darkBlue.withOpacity(0.5),
                      ),
                  hintText: "",
                  enabledBorder: textFieldBorder,
                  focusedBorder: textFieldBorder,
                  errorText: null,
                  fillColor: _textFieldFillColor,
                  filled: true,
                  helperText: "",
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      onTap: () => controller.onPasswordVisibilityChanged(),
                      child: Obx(
                        () {
                          return SizedBox(
                            height: 40,
                            width: 40,
                            child: SvgPicture.asset(
                              controller.isPasswordVisible.value
                                  ? ThemeIcon.eyeOpened
                                  : ThemeIcon.eyeClosed,
                              color: ThemeColor.darkBlue,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  suffixIconConstraints: const BoxConstraints(
                    maxHeight: 20,
                    minWidth: 20,
                  ),
                ),
                cursorColor: ThemeColor.darkGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder get textFieldBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: _textFieldFillColor,
        ),
      );
}
