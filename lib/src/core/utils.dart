import 'dart:developer' as developer;

import 'package:cv_maker/src/core/models/experience.dart';
import 'package:intl/intl.dart';

int getTimestamp() {
  return DateTime.now().millisecondsSinceEpoch;
}

String dateToString(DateTime date) {
  return DateFormat('dd/MM/yyyy').format(date);
}

DateTime stringToDate(String date) {
  try {
    return DateFormat('dd/MM/yyyy').parse(date);
  } catch (e) {
    logger(e);
    return DateTime.now();
  }
}

void logger(Object message) => developer.log(message.toString());

String getPeriod(Experience experience) {
  try {
    final now = DateTime.now();
    final date = stringToDate(experience.endDate);
    final startYear = experience.startDate.split('/')[2];
    final endYear =
        now.day == date.day && now.month == date.month && now.year == date.year
            ? 'Present'
            : experience.endDate.split('/')[2];
    return '$startYear - $endYear';
  } catch (e) {
    logger(e);
    return '';
  }
}
