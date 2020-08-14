import 'package:flutter/material.dart';
import 'package:flutter_user_course/calendar/calendar_page.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CalendarPage(),
    );
  }
}
