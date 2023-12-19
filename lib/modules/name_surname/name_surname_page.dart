import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/forms/input_text_field.dart';
import 'package:lines/widgets/layouts/app_scaffold_padding.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

class NameSurnamePage extends StatelessWidget {
  const NameSurnamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundImage: ThemeDecoration.images.bgDark,
      extendBodyBehindAppBar: true,
      appBar: const TransparentAppBar(
        title: TitleSmall(
          "CONOSCIAMOCI",
        ),
      ),
      body: Column(
        children: [
          ThemeSizedBox.height16,
          const DisplayMedium("Come ti chiami?"),
          ThemeSizedBox.height32,
          InputTextField(
            label: "Nome*",
            placeholder: "Inserisci il tuo nome",
            textEditingController: TextEditingController(),
          ),
          ThemeSizedBox.height24,
          InputTextField(
            label: "Cognome*",
            placeholder: "Inserisci il tuo cognome",
            textEditingController: TextEditingController(),
          ),
          ThemeSizedBox.height32,
          const Divider(
            thickness: 2,
          ),
          ThemeSizedBox.height32,
          InputTextField(
            label: "Nickname (facoltativo)",
            placeholder: "Scegli un nickname",
            textEditingController: TextEditingController(),
          ),
        ],
      ),
    );
  }
}
