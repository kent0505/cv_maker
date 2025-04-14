import 'package:flutter/material.dart';

import 'constants.dart';

final lightTheme = ThemeData(
  useMaterial3: false,
  fontFamily: AppFonts.funnel400,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    secondary: Color(0xffC7DDF4), // overscroll indicator color
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Color(0xff007AFF),
    selectionColor: Color(0xffBBDCFF),
    selectionHandleColor: Color(0xffBBDCFF),
  ),
  dialogTheme: const DialogTheme(
    insetPadding: EdgeInsets.zero,
    backgroundColor: Color(0xffe7e7e7),
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.all(Radius.circular(16)),
    // ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 16,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    hintStyle: TextStyle(
      color: Color(0xff808080).withValues(alpha: 0.55),
      fontSize: 14,
      fontFamily: AppFonts.funnel400,
    ),
  ),
);
