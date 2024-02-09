import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

import '../../../core/app_theme.dart';
import '../../../data/models/advices_article.dart';
import '../../../data/models/advices_category.dart';
import '../../../widgets/appbar/transparent_app_bar.dart';
import '../../../widgets/layouts/app_scaffold_page.dart';

class AdvicesVideoArticleDetail extends StatefulWidget {
  final AdvicesArticle article;
  final AdvicesCategory category;

  const AdvicesVideoArticleDetail({
    required this.article,
    required this.category,
    super.key,
  });

  @override
  State<AdvicesVideoArticleDetail> createState() =>
      _AdvicesVideoArticleDetailState();
}

class _AdvicesVideoArticleDetailState extends State<AdvicesVideoArticleDetail> {
  late VideoPlayerController _controller;

  bool _hasStarted = false;
  late Duration duration;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    debugPrint('${widget.article.videoImagePreviewUrl != null}');
    super.initState();
    if (widget.article.videoUrl?.isNotEmpty == true) {
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.article.videoUrl!),
      )..initialize().then(
          (_) {
            duration = _controller.value.duration;
          },
        );
      _controller.addListener(() {
        if (_controller.value.isPlaying) {
          duration = _controller.value.duration - _controller.value.position;
        }
        if (_controller.value.position == _controller.value.duration) {
          _hasStarted = false;
          _controller.seekTo(Duration.zero);
          duration = _controller.value.duration;
        }
        setState(() {});
      });
    }
  }

  String _durationToString(Duration duration) {
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);

    return "$minutes:${_twoDigits(seconds)}";
  }

  String _twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  static Color playButtonColor = const Color(0xffc1827c);
  static const Color _disclaimerColor = Color(0x7f1f2d4f);
  static const Color _timerBgColor = Color(0xff603ba1);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      appBar: TransparentAppBar(
        actions: [
          SvgPicture.asset(
            ThemeIcon.shareGradient,
            color: ThemeColor.darkBlue,
          ),
          ThemeSizedBox.width24,
          SvgPicture.asset(
            ThemeIcon.savedEmpty,
            color: ThemeColor.darkBlue,
          ),
        ],
        backButtonColor: ThemeColor.darkBlue,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: _controller.value.isInitialized
            ? ListView(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: widget.category.categoryColor,
                    child: SvgPicture.asset(
                      widget.category.iconPath,
                      color: Colors.white,
                    ),
                  ),
                  ThemeSizedBox.height8,
                  TitleMedium(
                    widget.category.categoryTitle != null
                        ? widget.category.categoryTitle!.toUpperCase()
                        : "",
                    color: ThemeColor.darkBlue,
                    textAlign: TextAlign.center,
                  ),
                  ThemeSizedBox.height4,
                  DisplayMedium(
                    widget.article.title,
                    textAlign: TextAlign.center,
                  ).applyShaders(context),
                  ThemeSizedBox.height40,
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: VideoPlayer(_controller),
                        ),
                        Visibility(
                          visible: _hasStarted == false,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              widget.article.videoImagePreviewUrl!,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: !_controller.value.isPlaying,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(
                                10,
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: _timerBgColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(90),
                                  ),
                                ),
                                child: BodySmall(
                                  _durationToString(duration),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(
                              () {
                                _hasStarted = true;
                                if (_controller.value.isPlaying) {
                                  _controller.pause();
                                } else {
                                  _controller.play();
                                }
                              },
                            );
                          },
                          child: !_controller.value.isPlaying
                              ? Center(
                                  child: CircleAvatar(
                                    radius: 28,
                                    backgroundColor: playButtonColor,
                                    child: SvgPicture.asset(
                                      ThemeIcon.play,
                                    ),
                                  ),
                                )
                              : const SizedBox.expand(),
                        ),
                      ],
                    ),
                  ),
                  ThemeSizedBox.height40,
                  LabelLarge(
                    widget.article.disclaimer ?? "",
                    color: _disclaimerColor,
                    fontWeight: FontWeight.w500,
                  ),
                  ThemeSizedBox.height60,
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
