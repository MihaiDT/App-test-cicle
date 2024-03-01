import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/table_calendar/src/customization/calendar_style.dart';
import 'package:lines/table_calendar/src/model/selected_range.dart';
import 'package:lines/table_calendar/src/shared/utils.dart';
import 'package:lines/table_calendar/src/table_calendar.dart';

class HorizontalRangeCalendar extends StatefulWidget {
  final Function(DateTimeRange?) onRangeSelected;

  const HorizontalRangeCalendar({
    required this.onRangeSelected,
    super.key,
  });

  @override
  State<HorizontalRangeCalendar> createState() =>
      _HorizontalRangeCalendarState();
}

class _HorizontalRangeCalendarState extends State<HorizontalRangeCalendar> {
  late ValueNotifier<SelectedRange> _selectedRange;

  @override
  void initState() {
    super.initState();
    _selectedRange = ValueNotifier(
      SelectedRange(start: null, end: null),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// PAY ATTENTION TO TABLE CALENDAR, IS A FORKED PACKAGE
    return ValueListenableBuilder(
      valueListenable: _selectedRange,
      builder: (context, value, _) {
        return TableCalendar(
          availableGestures: AvailableGestures.none,
          calendarStyle: calendarStyle,
          daysOfWeekVisible: false,
          focusedDay: focusedDay,
          firstDay: firstDate,
          locale: 'it',
          onRangeSelected: _onRangeSelected,
          rangeStartDay: value.start,
          rangeEndDay: value.end,
          rangeSelectionMode: RangeSelectionMode.toggledOn,
          lastDay: lastDate,
          weekendDays: [],
          weekNumbersVisible: false,
          sixWeekMonthsEnforced: false,
          pageJumpingEnabled: true,
          startingDayOfWeek: StartingDayOfWeek.monday,
          onDayLongPressed: (_, __) {},
        );
      },
    );
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    _selectedRange.value = SelectedRange(
      start: start,
      end: end,
    );

    widget.onRangeSelected.call(selectedRange);
  }

  DateTime get focusedDay =>
      _selectedRange.value.end ?? _selectedRange.value.start ?? DateTime.now();

  DateTime get lastDate {
    DateTime last = DateTime(
      DateTime.now().year + 1,
      DateTime.now().month + 1,
    );

    return last;
  }

  CalendarStyle get calendarStyle => CalendarStyle(
        defaultTextStyle: normalTextStyle(),
        rangeStartTextStyle: rangeTextStyle,
        rangeStartDecoration: getRangeBoxDecoration(),
        withinRangeTextStyle: rangeTextStyle,
        withinRangeDecoration: getRangeBoxDecoration(0.6),
        rangeEndTextStyle: rangeTextStyle,
        rangeEndDecoration: getRangeBoxDecoration(),
        rangeHighlightColor: Colors.transparent,
        defaultDecoration: getRangeBoxDecoration(0.15),
        outsideTextStyle: normalTextStyle(0.5),
        outsideDecoration: getRangeBoxDecoration(0.15),
        disabledDecoration: getRangeBoxDecoration(0.15),
        isTodayHighlighted: false,
        cellMargin: const EdgeInsets.all(4),
      );

  DateTime get firstDate {
    DateTime first = DateTime(
      DateTime.now().year - 3,
    );

    return first;
  }

  TextStyle get rangeTextStyle =>
      Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: ThemeColor.primary,
          );

  BoxDecoration getRangeBoxDecoration([double? opacity]) {
    return BoxDecoration(
      color: Colors.white.withOpacity(opacity ?? 1),
      shape: BoxShape.circle,
    );
  }

  TextStyle normalTextStyle([double? opacity]) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.white.withOpacity(opacity ?? 1),
        );
  }

  DateTimeRange? get selectedRange {
    if (_selectedRange.value.start != null &&
        _selectedRange.value.end != null) {
      return DateTimeRange(
        start: _selectedRange.value.start!,
        end: _selectedRange.value.end!,
      );
    } else {
      return null;
    }
  }
}
