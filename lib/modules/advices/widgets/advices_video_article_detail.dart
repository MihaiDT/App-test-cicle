import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/advices/controllers/advices_detail_controller.dart';
import 'package:lines/modules/advices/widgets/suggested_article_section.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AdvicesVideoArticleDetail extends GetView<AdvicesDetailController> {
  const AdvicesVideoArticleDetail({
    super.key,
  });

  static Color playButtonColor = const Color(0xffc1827c);
  static const Color _disclaimerColor = Color(0x7f1f2d4f);
  static const Color _timerBgColor = Color(0xff603ba1);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      appBar: TransparentAppBar(
        actions: [
          if (controller.article?.id.isNotEmpty == true)
            InkWell(
              onTap: () async {
                await Share.share(
                  'https://lines-test-link.s3.amazonaws.com/articles/${controller.article?.id}',
                );
              },
              child: SvgPicture.asset(
                ThemeIcon.shareGradient,
                color: ThemeColor.darkBlue,
              ),
            ),
          ThemeSizedBox.width24,
          InkWell(
            onTap: () {
              if (controller.isArticleFav.value) {
                controller.removeArticleFromFav();
              } else {
                controller.addArticleToFav();
              }
            },
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
              child: Obx(
                () {
                  if (controller.isArticleFav.value) {
                    return SvgPicture.asset(
                      ThemeIcon.savedFilled,
                      color: ThemeColor.darkBlue,
                    );
                  } else {
                    return SvgPicture.asset(
                      ThemeIcon.savedEmpty,
                      color: ThemeColor.darkBlue,
                    );
                  }
                },
              ),
            ),
          ),
        ],
        backButtonColor: ThemeColor.darkBlue,
      ),
      backgroundColor: Colors.white,
      body: Obx(
        () => controller.videoIsInitialized.value
            ? ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: controller.category?.categoryColor,
                        child: SvgPicture.asset(
                          controller.category?.iconPath ?? "",
                          color: Colors.white,
                        ),
                      ),
                      ThemeSizedBox.height8,
                      TitleMedium(
                        controller.category?.categoryTitle?.toUpperCase() ?? "",
                        color: ThemeColor.darkBlue,
                        textAlign: TextAlign.center,
                      ),
                      ThemeSizedBox.height4,
                      DisplayMedium(
                        controller.article?.title ?? "",
                        textAlign: TextAlign.center,
                      ).applyShaders(context),
                      ThemeSizedBox.height40,
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controller: controller.youtubePlayerController,
                          ),
                          builder: (_, Widget player) {
                            return InkWell(
                              onTap: () {
                                if (controller.hasStarted.value) {
                                  controller.youtubePlayerController.pause();
                                  controller.hasStarted.value = false;
                                } else {
                                  controller.youtubePlayerController.play();
                                  controller.hasStarted.value = true;
                                }
                              },
                              child: Stack(
                                fit: StackFit.passthrough,
                                children: [
                                  player,
                                  Column(
                                    children: [
                                      Obx(
                                        () {
                                          return Visibility(
                                            visible:
                                                !controller.hasStarted.value,
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  10,
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: _timerBgColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(90),
                                                    ),
                                                  ),
                                                  child: BodySmall(
                                                    controller.durationToString(
                                                      controller.duration.value,
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      ThemeSizedBox.height12,
                                      Obx(
                                        () {
                                          return Align(
                                            alignment: Alignment.center,
                                            child: Visibility(
                                              visible:
                                                  !controller.hasStarted.value,
                                              child: CircleAvatar(
                                                radius: 28,
                                                backgroundColor:
                                                    playButtonColor,
                                                child: SvgPicture.asset(
                                                  ThemeIcon.play,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      ThemeSizedBox.height40,
                      LabelLarge(
                        controller.article?.disclaimer ?? "",
                        color: _disclaimerColor,
                        fontWeight: FontWeight.w500,
                      ),
                      ThemeSizedBox.height60,
                    ],
                  ),
                  const SuggestedArticleSection(),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
