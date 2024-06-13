import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/content_library/widgets/tab_indicator.dart';

class UnderlinedTabBar extends StatelessWidget {
  final TabController tabController;

  final List<Tab> tabs;
  final List<Widget> pages;

  final Function(int) onTap;

  const UnderlinedTabBar({
    required this.tabController,
    required this.tabs,
    required this.pages,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            Positioned(
              bottom: 6,
              left: 0,
              right: 0,
              child: Container(
                height: 2,
                color: ThemeColor.normalGrey.withOpacity(0.3),
              ),
            ),
            TabBar(
              onTap: onTap,
              labelStyle: ThemeTextStyle.headlineMedium,
              labelColor: ThemeColor.brightPink,
              controller: tabController,
              tabs: tabs,
              dividerColor: Colors.transparent,
              indicator: TabIndicator(
                color: ThemeColor.brightPink,
                radius: 5,
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: pages,
          ),
        ),
      ],
    );
  }
}
