import 'package:flutter/material.dart';
export 'package:flutter_gen/gen_l10n/app_localizations.dart';

final class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.black,
    required this.white,
    required this.blue1,
    required this.blue2,
    required this.red1,
    required this.red2,
    required this.green,
    required this.grey1,
    required this.grey2,
    required this.grey3,
    required this.grey4,
    required this.bg,
  });

  final Color black;
  final Color white;
  final Color blue1;
  final Color blue2;
  final Color red1;
  final Color red2;
  final Color green;
  final Color grey1;
  final Color grey2;
  final Color grey3;
  final Color grey4;
  final Color bg;

  factory MyColors.light() {
    return MyColors(
      black: Color(0xff000000),
      white: Color(0xffFFFFFF),
      blue1: Color(0xff007AFF),
      blue2: Color(0xffBBDCFF),
      red1: Color(0xffFF0000),
      red2: Color(0xffFD9191),
      green: Color(0xff00FF40),
      grey1: Color(0xffE8E8F2),
      grey2: Color(0xff9C9C9C),
      grey3: Color(0xff444444),
      grey4: Color(0xff3C3C43).withValues(alpha: 0.6),
      bg: Color(0xffC7DDF4),
    );
  }

  @override
  MyColors copyWith({
    Color? black,
    Color? white,
    Color? blue1,
    Color? blue2,
    Color? red1,
    Color? red2,
    Color? green,
    Color? grey1,
    Color? grey2,
    Color? grey3,
    Color? grey4,
    Color? bg,
  }) {
    return MyColors(
      black: black ?? this.black,
      white: white ?? this.white,
      blue1: blue1 ?? this.blue1,
      blue2: blue2 ?? this.blue2,
      red1: red1 ?? this.red1,
      red2: red2 ?? this.red2,
      green: green ?? this.green,
      grey1: grey1 ?? this.grey1,
      grey2: grey2 ?? this.grey2,
      grey3: grey3 ?? this.grey3,
      grey4: grey4 ?? this.grey4,
      bg: bg ?? this.bg,
    );
  }

  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) return this;
    return MyColors(
      black: Color.lerp(black, other.black, t)!,
      white: Color.lerp(white, other.white, t)!,
      blue1: Color.lerp(blue1, other.blue1, t)!,
      blue2: Color.lerp(blue2, other.blue2, t)!,
      red1: Color.lerp(red1, other.red1, t)!,
      red2: Color.lerp(red2, other.red2, t)!,
      green: Color.lerp(green, other.green, t)!,
      grey1: Color.lerp(grey1, other.grey1, t)!,
      grey2: Color.lerp(grey2, other.grey2, t)!,
      grey3: Color.lerp(grey3, other.grey3, t)!,
      grey4: Color.lerp(grey4, other.grey4, t)!,
      bg: Color.lerp(bg, other.bg, t)!,
    );
  }
}
