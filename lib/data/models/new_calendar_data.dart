import 'package:lines/data/models/new_single_day_data.dart';

class NewCalendarData {
  final List<NewSingleDayData> calendarDays;

  NewCalendarData({
    required this.calendarDays,
  });

  factory NewCalendarData.fromJson(Map<String, dynamic> json) {
    final List<NewSingleDayData> calendarDays = [];

    for (final jsonItem in json['dates']) {
      calendarDays.add(
        NewSingleDayData.fromJson(jsonItem),
      );
    }

    return NewCalendarData(
      calendarDays: calendarDays,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dates': calendarDays.map((e) => e.toJson()).toList(),
    };
  }
}
