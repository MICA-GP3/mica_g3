import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarW extends StatefulWidget {
  @override
  _TableBasicsExampleState createState() => _TableBasicsExampleState();

  static DateTime? selectDate() {
    return _TableBasicsExampleState.selectD(_selectedDay);
  }
}

final kNow = DateTime.now();
final kFirstDay = DateTime(kNow.year, kNow.month - 3, kNow.day);
final kLastDay = DateTime(kNow.year, kNow.month + 3, kNow.day);
DateTime? _selectedDay;

class _TableBasicsExampleState extends State<CalendarW> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
            selectD(selectedDay);
          });
        }
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }

  static DateTime? selectD(_selectedDay) {
    print(_selectedDay);
    return _selectedDay;
  }
}
