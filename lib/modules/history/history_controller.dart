import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/calendar_service.dart';

class HistoryController extends GetxController {
  final List<String> periodDays = [];
  final RxList<Map<String, dynamic>> historyDays = RxList.from([]);
  final List<Map<String, dynamic>> tmpHistoryDays = List.from([]);

  @override
  void onInit() {
    super.onInit();

    _fetchData();
  }

  void _fetchData() async {
    await CalendarService.symptomsDiaryHistory();

    periodDays.addAll(
      appController.calendarData.value!.calendarDays
          .where((element) => element.isMensesDay)
          .map((e) => e.date),
    );

    String date = '';
    String catCode = '';

    Map<String, dynamic> historyDay = {};

    for (final String periodDay in periodDays) {
      tmpHistoryDays.add({
        'date': periodDay,
        'symptomsCategories': List.empty(growable: true),
        'isDuringPeriod': true,
      });
    }

    for (final item in appController.symptomsDiariesHistory.value ?? []) {
      if (item['date'] != date) {
        if (date != '') {
          historyDays.add(historyDay);
        }

        date = item['date'];
        catCode = '';

        final tmpHistoryDay = tmpHistoryDays.firstWhereOrNull(
            (historyDay) => historyDay['date'] == item['date']);

        if (tmpHistoryDay == null) {
          historyDay = {
            'date': item['date'],
            'isDuringPeriod': false,
            'symptomsCategories': List.empty(growable: true),
          };
        } else {
          historyDay = tmpHistoryDay;
        }
      }

      if (catCode != item['cat_code']) {
        catCode = item['cat_code'];

        historyDay['symptomsCategories'].add({
          'symptomsCategoryCode': item['cat_code'],
          'symptomsCategoryName': item['cat_name'],
          'symptoms': [
            {
              'code': item['sym_code'],
              'name': item['sym_name'],
            },
          ],
        });
      } else {
        historyDay['symptomsCategories'].last['symptoms'].add(
          {
            'code': item['sym_code'],
            'name': item['sym_name'],
          },
        );
      }
    }

    historyDays.add(historyDay);

    historyDays.sort((a, b) => b['date'].compareTo(a['date']));
    historyDays.refresh();
  }
}
