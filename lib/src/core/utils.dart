import 'dart:developer' as developer;

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

double getTitleFontSize(int id) {
  if (id == 1) return 16;
  if (id == 2) return 24;
  if (id == 3) return 24;
  if (id == 4) return 20;
  if (id == 5) return 14;

  if (id == 6) return 16;
  if (id == 7) return 16;
  if (id == 8) return 16;
  if (id == 9) return 16;
  if (id == 10) return 16;

  if (id == 11) return 16;
  if (id == 12) return 16;
  if (id == 13) return 16;
  if (id == 14) return 16;
  if (id == 15) return 16;

  if (id == 16) return 16;
  if (id == 17) return 16;
  if (id == 18) return 16;
  if (id == 19) return 16;
  if (id == 20) return 16;
  return 16;
}
