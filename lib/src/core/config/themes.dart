import 'package:flutter/material.dart';

import 'constants.dart';
import 'my_colors.dart';

// final l = AppLocalizations.of(context)!;
// final colors = Theme.of(context).extension<MyColors>()!;

final _ligthColors = MyColors.light();

final lightTheme = ThemeData(
  useMaterial3: false,
  fontFamily: AppFonts.funnel400,
  brightness: Brightness.light,
  scaffoldBackgroundColor: _ligthColors.white,
  colorScheme: ColorScheme.light(
    surface: _ligthColors.white,
    secondary: _ligthColors.bg, // overscroll indicator color
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: _ligthColors.blue1,
    selectionColor: _ligthColors.blue2,
    selectionHandleColor: _ligthColors.blue2,
  ),
  dialogTheme: const DialogTheme(
    insetPadding: EdgeInsets.zero,
    backgroundColor: Color(0xffB3B3B3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: _ligthColors.white,
    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    hintStyle: TextStyle(
      color: Color(0xff808080).withValues(alpha: 0.55),
      fontSize: 14,
      fontFamily: AppFonts.funnel400,
    ),
  ),
  extensions: [_ligthColors],
);
