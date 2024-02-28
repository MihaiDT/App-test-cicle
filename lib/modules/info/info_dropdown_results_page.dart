import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/info_group.dart';
import 'package:lines/data/models/product.dart';
import 'package:lines/modules/info/widgets/info_dropdown.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

class InfoDropDownResultsPage extends StatelessWidget {
  const InfoDropDownResultsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundColor: Colors.white,
      appBar: const TransparentAppBar(
        backButtonColor: ThemeColor.darkBlue,
        title: TitleMedium(
          "INFO",
          color: ThemeColor.darkBlue,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeSize.paddingLarge,
            ),
            child: const DisplayMedium(
              "Quanti coins valgono i prodotti?",
              textAlign: TextAlign.center,
            ).applyShaders(context),
          ),
          ThemeSizedBox.height32,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: InfoDropDown(
              groups: [
                InfoGroup(
                  title: "Lines è",
                  products: [
                    Product(
                      name: "Lines è con ali",
                      points: 250,
                    ),
                    Product(
                      name: "Lines è con ali",
                      points: 250,
                    ),
                    Product(
                      name: "Lines è con ali",
                      points: 250,
                    ),
                    Product(
                      name: "Lines è con ali",
                      points: 250,
                    ),
                  ],
                ),
                InfoGroup(
                  title: "Special pack lines è",
                  products: [
                    Product(
                      name: "Lines è con ali",
                      points: 250,
                    ),
                    Product(
                      name: "Lines è con ali",
                      points: 250,
                    ),
                    Product(
                      name: "Lines è con ali",
                      points: 250,
                    ),
                    Product(
                      name: "Lines è con ali",
                      points: 250,
                    ),
                    Product(
                      name: "Lines è con ali",
                      points: 250,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
