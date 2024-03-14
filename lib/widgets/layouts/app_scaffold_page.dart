import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';

class AppScaffoldPage extends StatelessWidget {
  final Color? backgroundColor;

  final Widget? bottomNavigationBar;
  final DecorationImage? backgroundImage;
  final PreferredSizeWidget? appBar;
  final Widget body;

  final Widget? drawer;
  final bool extendBodyBehindAppBar;
  final ScrollController? scrollController;

  const AppScaffoldPage({
    super.key,
    this.appBar,
    this.backgroundColor,
    this.backgroundImage,
    this.bottomNavigationBar,
    required this.body,
    this.drawer,
    this.extendBodyBehindAppBar = false,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor ?? ThemeColor.background,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            image: backgroundImage,
          ),
          height: Get.height,
          width: Get.width,
          child: body,
        ),
      ),
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      resizeToAvoidBottomInset: true,
    );
  }
}
