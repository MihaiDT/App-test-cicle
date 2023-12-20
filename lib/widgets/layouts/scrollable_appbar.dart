import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/theme/text_wrapper.dart';

import '../../core/app_theme.dart';
import '../../core/utils/helpers.dart';
import '../../widgets/buttons/app_icon_button.dart';
import 'app_scaffold_controller.dart';

class ScrollableAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppScaffoldController? controller;

  final bool itemsDark;
  final bool centerTitle;
  final bool forceElevation;
  final Widget? rightWidget;
  final ScrollController? scrollController;
  final bool showBackBtn;
  final Widget? leftWidget;
  final bool showCloseBtn;
  final String? title;
  final bool titleAlwaysVisible;
  final bool titleSmall;
  final double? toolbarHeight;

  final RxBool _showExpandedWidget = false.obs;

  // TODO: farlo dinamico in base alla globalKey sul title
  static double scrollOffset = 50;

  ScrollableAppBar({
    super.key,
    this.controller,
    this.forceElevation = false,
    this.itemsDark = true,
    this.centerTitle = true,
    this.leftWidget,
    this.rightWidget,
    this.scrollController,
    this.showBackBtn = false,
    this.showCloseBtn = false,
    this.title,
    this.titleSmall = false,
    this.titleAlwaysVisible = false,
    this.toolbarHeight,
  }) {
    scrollController?.addListener(() {
      if (_showExpandedWidget.value != isSliverAppBarExpanded) {
        _showExpandedWidget.value = isSliverAppBarExpanded;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(Get.context!)
          .copyWith(textScaler: const TextScaler.linear(1)),
      child: Obx(
        () => AppBar(
          actions: rightWidget != null
              ? [rightWidget!]
              : showCloseBtn
                  ? [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: _closeButton(context),
                      )
                    ]
                  : [],
          backgroundColor: Colors.transparent,
          centerTitle: centerTitle,
          elevation: forceElevation
              ? 0
              : _showExpandedWidget.value
                  ? 1
                  : 0,
          leading: showBackBtn
              ? Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: _backButton(context),
                )
              : leftWidget ?? const SizedBox.shrink(),
          title: _title(),
          toolbarHeight: toolbarHeight ?? kToolbarHeight,
        ),
      ),
    );
  }

  Widget _backButton(BuildContext context) {
    return AppIconButton(
      onTap: () => controller != null
          ? controller!.onTapBack()
          : _backDefaultBehaviour(context),
      iconPath: ThemeIcon.back,
    );
  }

  Widget _closeButton(BuildContext context) {
    return AppIconButton(
      onTap: () => controller != null
          ? controller!.onTapBack()
          : _backDefaultBehaviour(context),
      iconPath: ThemeIcon.back,
    );
  }

  _backDefaultBehaviour(BuildContext context) {
    dismissKeyboard(context);
    Get.back();
  }

  Widget _title() {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: _showExpandedWidget.value || titleAlwaysVisible
          ? 1.0
          : _showExpandedWidget.value
              ? 1.0
              : 0.0,
      child: SizedBox(
        height: ThemeSize.heightAppBarDefault,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 4.0,
              ),
              child: DisplayMedium(
                title ?? '',
                color: ThemeColor.primary,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool get isSliverAppBarExpanded =>
      scrollController != null &&
      scrollController!.hasClients &&
      scrollController!.offset > scrollOffset;

  @override
  Size get preferredSize => Size(Get.width, ThemeSize.heightAppBarDefault);
}
