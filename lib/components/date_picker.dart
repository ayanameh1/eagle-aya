import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

late int maxY;
late int maxM;
late int maxD;

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime todaydate = DateTime.now();

  late int d = todaydate.day + 4;
  late int m = todaydate.month;
  late int y = todaydate.year;

  late int max = 2050;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 250,
      child: buildDatepicker(),
    );
  }

  Widget buildDatepicker() => CupertinoDatePicker(
        initialDateTime: todaydate.add(Duration(days: 7)),
        mode: CupertinoDatePickerMode.date,
        minimumDate: DateTime(y, m, d),
        onDateTimeChanged: (date) => setState(() {
          this.todaydate = date;
          maxD = date.day;
          maxM = date.month;
          maxY = date.year;
        }),
      );
}

class Timepicker extends StatefulWidget {
  const Timepicker({Key? key}) : super(key: key);

  @override
  State<Timepicker> createState() => _TimepickerState();
}

class _TimepickerState extends State<Timepicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 250,

      child: buildtimepicker(),
    );
  }

  Widget buildtimepicker() => CupertinoDatePicker(
        mode: CupertinoDatePickerMode.time,
        onDateTimeChanged: (DateTime value) {

        },
      );
}
