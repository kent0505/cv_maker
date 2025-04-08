import 'dart:developer' as developer;

import 'package:intl/intl.dart';

int getTimestamp() {
  return DateTime.now().millisecondsSinceEpoch;
}

String dateToString(DateTime date) {
  return DateFormat('dd.MM.yyyy').format(date);
}

DateTime stringToDate(String date) {
  try {
    return DateFormat('dd.MM.yyyy').parse(date);
  } catch (e) {
    logger(e);
    return DateTime.now();
  }
}

void logger(Object message) => developer.log(message.toString());
