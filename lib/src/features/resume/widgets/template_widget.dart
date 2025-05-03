import 'package:flutter/material.dart';

import '../../../core/models/data.dart';
import 'templates/template1.dart';
import 'templates/template2.dart';
import 'templates/template3.dart';
import 'templates/template4.dart';
import 'templates/template5.dart';
import 'templates/template6.dart';
import 'templates/template7.dart';
import 'templates/template8.dart';
import 'templates/template9.dart';
import 'templates/template10.dart';
import 'templates/template11.dart';
import 'templates/template12.dart';
import 'templates/template13.dart';
import 'templates/template14.dart';
import 'templates/template15.dart';
import 'templates/template16.dart';
import 'templates/template17.dart';
import 'templates/template18.dart';
import 'templates/template19.dart';
import 'templates/template20.dart';

class TemplateWidget extends StatelessWidget {
  const TemplateWidget({
    super.key,
    required this.data,
    required this.id,
  });

  final Data data;
  final int id;

  @override
  Widget build(BuildContext context) {
    return switch (id) {
      1 => Template1(data: data),
      2 => Template2(data: data),
      3 => Template3(data: data),
      4 => Template4(data: data),
      5 => Template5(data: data),
      6 => Template6(data: data),
      7 => Template7(data: data),
      8 => Template8(data: data),
      9 => Template9(data: data),
      10 => Template10(data: data),
      11 => Template11(data: data),
      12 => Template12(data: data),
      13 => Template13(data: data),
      14 => Template14(data: data),
      15 => Template15(data: data),
      16 => Template16(data: data),
      17 => Template17(data: data),
      18 => Template18(data: data),
      19 => Template19(data: data),
      20 => Template20(data: data),
      _ => const SizedBox(),
    };
  }
}
