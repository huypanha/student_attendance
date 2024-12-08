import 'package:flutter/material.dart';
import 'package:student_attendance/features/schedules/models/schedule.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ScheduleDataSource extends CalendarDataSource {
  ScheduleDataSource(List<ScheduleModel> data) {
    appointments = data;
  }

  @override
  DateTime getStartTime(int index) => (appointments![index] as ScheduleModel).startTime!;

  @override
  DateTime getEndTime(int index) => (appointments![index] as ScheduleModel).endTime!;

  @override
  Color getColor(int index) => Color(int.parse((appointments![index] as ScheduleModel).colorCode!));

  @override
  String getSubject(int index) => (appointments![index] as ScheduleModel).courseModel!.subject!;
}