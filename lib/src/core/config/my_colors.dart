import 'package:flutter/material.dart';

final class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.textPrimary,
    required this.blue,
    required this.red,
    required this.green,
    required this.bg1,
    required this.bg2,
  });

  final Color textPrimary;
  final Color blue;
  final Color red;
  final Color green;
  final Color bg1;
  final Color bg2;

  factory MyColors.light() {
    return MyColors(
      textPrimary: Color(0xff000000),
      blue: Color(0xff007AFF),
      red: Color(0xffFF0000),
      green: Color(0xff00FF40),
      bg1: Color(0xffFFFFFF),
      bg2: Color(0xffC7DDF4),
    );
  }

  @override
  MyColors copyWith({
    Color? textPrimary,
    Color? blue,
    Color? red,
    Color? green,
    Color? bg1,
    Color? bg2,
  }) {
    return MyColors(
      textPrimary: textPrimary ?? this.textPrimary,
      blue: blue ?? this.blue,
      red: red ?? this.red,
      green: green ?? this.green,
      bg1: bg1 ?? this.bg1,
      bg2: bg2 ?? this.bg2,
    );
  }

  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) return this;
    return MyColors(
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      red: Color.lerp(red, other.red, t)!,
      green: Color.lerp(green, other.green, t)!,
      bg1: Color.lerp(bg1, other.bg1, t)!,
      bg2: Color.lerp(bg2, other.bg2, t)!,
    );
  }
}
