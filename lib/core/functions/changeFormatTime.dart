import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

changeFormatTime(TimeOfDay time) {
  return DateFormat('hh:00 a').format(DateTime(DateTime.now().year,
      DateTime.now().month, DateTime.now().day, time.hour, time.minute));
}

changeFormatTimeForBackEnd(TimeOfDay time) {
  return DateFormat('HH:00').format(DateTime(DateTime.now().year,
      DateTime.now().month, DateTime.now().day, time.hour, time.minute));
}

changeFormatDateForBackEnd(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}
