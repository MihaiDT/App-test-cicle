import 'package:lines/data/models/single_day_data.dart';

class NewCalendarData {
  final List<SingleDayData> calendarDays;

  NewCalendarData({
    required this.calendarDays,
  });

  factory NewCalendarData.fromJson(Map<String, dynamic> json) {
    final List<SingleDayData> calendarDays = [];

    for (final jsonItem in json['dates']) {
      calendarDays.add(
        SingleDayData.fromJson(jsonItem),
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
