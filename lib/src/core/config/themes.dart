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
  scaffoldBackgroundColor: _ligthColors.bg1,
  colorScheme: ColorScheme.light(
    surface: _ligthColors.bg1,
    secondary: _ligthColors.bg2, // overscroll indicator color
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: _ligthColors.blue,
    selectionColor: _ligthColors.blue,
    selectionHandleColor: _ligthColors.blue,
  ),
  appBarTheme: AppBarTheme(
    toolbarHeight: 48,
    backgroundColor: _ligthColors.bg1,
    titleTextStyle: TextStyle(
      color: _ligthColors.textPrimary,
      fontSize: 18,
      fontFamily: AppFonts.funnel600,
    ),
    centerTitle: true,
    elevation: 0,
    actionsPadding: EdgeInsets.symmetric(horizontal: 16),
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
    fillColor: _ligthColors.bg1,
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
