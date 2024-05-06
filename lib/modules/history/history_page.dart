import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/history/history_controller.dart';
import 'package:lines/modules/history/widgets/history_row.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundColor: Colors.white,
      appBar: const TransparentAppBar(
        backButtonColor: ThemeColor.darkBlue,
        title: TitleMedium(
          'CRONOLOGIA DEL DIARIO',
          color: ThemeColor.darkBlue,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16,
        ),
        itemCount: 1,
        itemBuilder: (context, index) => HistoryRow(
          day: DateTime.now(),
        ),
      ),
    );
  }
}
