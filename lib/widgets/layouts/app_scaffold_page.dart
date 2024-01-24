import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/app_theme.dart';
import '../../core/helpers/keyboard.dart';
import '../../widgets/layouts/scroll_if_needed.dart';

class AppScaffoldPage extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final DecorationImage? backgroundImage;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final bool extendBodyBehindAppBar;
  final ScrollController? scrollController;

  const AppScaffoldPage({
    super.key,
    this.appBar,
    this.backgroundColor,
    this.backgroundImage,
    this.bottomNavigationBar,
    required this.body,
    this.extendBodyBehindAppBar = false,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor ?? ThemeColor.background,
      body: _body(context),
      extendBody: true,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      resizeToAvoidBottomInset: true,
    );
  }

  _body(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: backgroundImage,
      ),
      height: Get.height,
      width: Get.width,
      child: scrollController != null
          ? ScrollIfNeeded(
              disableTap: true,
              scrollController: scrollController!,
              child: MediaQuery(
                data: MediaQuery.of(Get.context!).copyWith(textScaleFactor: 1),
                child: InkWell(
                  onTap: () => dismissKeyboard(context),
                  child: body,
                ),
              ),
            )
          : MediaQuery(
              data: MediaQuery.of(Get.context!).copyWith(textScaleFactor: 1),
              child: InkWell(
                onTap: () => dismissKeyboard(context),
                child: body,
              ),
            ),
    );
  }
}
