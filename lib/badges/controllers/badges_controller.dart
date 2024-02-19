import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BadgesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      vsync: this,
      length: tabs.length,
    );
  }

  List<Tab> tabs = [
    const Tab(
      text: "In corso",
    ),
    const Tab(
      text: "Completati",
    ),
  ];
}
