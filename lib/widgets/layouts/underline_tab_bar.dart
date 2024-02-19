import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/content_library/widgets/tab_indicator.dart';

class UnderlinedTabBar extends StatelessWidget {
  final TabController tabController;

  final List<Tab> tabs;
  final List<Widget> pages;

  const UnderlinedTabBar({
    required this.tabController,
    required this.tabs,
    required this.pages,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TabBar(
          labelStyle: NewThemeTextStyle.headlineMedium,
          unselectedLabelColor: ThemeColor.darkBlue,
          labelColor: ThemeColor.brightPink,
          controller: tabController,
          tabs: tabs,
          indicator: TabIndicator(
            color: ThemeColor.brightPink,
            radius: 5,
          ),
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
