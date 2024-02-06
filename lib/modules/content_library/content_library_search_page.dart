import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lines/modules/content_library/widgets/article_category_widget.dart';

import '../../core/app_theme.dart';
import '../../data/enums/advices_category.dart';

class ContentLibrarySearchPage extends StatelessWidget {
  const ContentLibrarySearchPage({
    super.key,
  });

  static const Color textFieldBorderColor = Color(0xffe6e0ef);
  static const Color textFieldFillColor = Color(0xfff7f3f8);
  static Color placeHolderColor = const Color(0x1e2d4f80).withOpacity(0.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  ThemeSizedBox.height12,
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: const BoxDecoration(
                            color: textFieldBorderColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: TextField(
                            enableSuggestions: false,
                            style: NewThemeTextStyle.bodyMedium.copyWith(
                              color: ThemeColor.darkBlue,
                            ),
                            cursorColor: ThemeColor.darkBlue,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                              ),
                              filled: true,
                              fillColor: textFieldFillColor,
                              hintText: 'Cerca tra i contenuti',
                              hintStyle: NewThemeTextStyle.bodyMedium.copyWith(
                                color: placeHolderColor,
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 14,
                                ),
                                child: SvgPicture.asset(
                                  ThemeIcon.search,
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    11,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ThemeSizedBox.width16,
                      const BodyMedium(
                        'Annulla',
                        color: ThemeColor.darkBlue,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: AdvicesCategory.values.length,
                      itemBuilder: (context, index) {
                        //temp solution , change when logic is ready
                        const int itemCount = 2;
                        return Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 14,
                                  backgroundColor: AdvicesCategory
                                      .values[index].categoryColor,
                                  child: SvgPicture.asset(
                                    AdvicesCategory.values[index].iconPath,
                                    color: Colors.white,
                                  ),
                                ),
                                ThemeSizedBox.width6,
                                HeadlineLarge(
                                  AdvicesCategory.values[index].categoryTitle
                                          .capitalizeFirst ??
                                      AdvicesCategory
                                          .values[index].categoryTitle,
                                  color: ThemeColor.darkBlue,
                                )
                              ],
                            ),
                            const Divider(),
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: itemCount,
                              itemBuilder: (context, index) {
                                return const ArticleCategoryWidget(
                                  articleName: 'Tutto ginecologia',
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                            ),
                            const Divider(),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
