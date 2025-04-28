import 'package:flutter/material.dart';

import '../../../../../core/config/constants.dart';
import '../../../../../core/models/data.dart';

class TemplateSkills extends StatelessWidget {
  const TemplateSkills({
    super.key,
    required this.data,
    this.left = 0,
    this.right = 10,
  });

  final Data data;
  final double left;
  final double right;

  @override
  Widget build(BuildContext context) {
    final skills = data.skills;
    final template = data.resume!.template;

    return Padding(
      padding: EdgeInsets.only(
        left: left,
        right: right,
      ),
      child: Wrap(
        runSpacing: 6,
        spacing: 4,
        children: List.generate(
          skills.length,
          (index) {
            return _Card(
              title: skills[index].title,
              index: template,
            );
          },
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    required this.title,
    required this.index,
  });

  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: _getColor(index),
        borderRadius: BorderRadius.circular(_getBorderRadius(index)),
        border: Border.all(
          width: 0.5,
          color: _getBorderColor(index),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 6,
          fontFamily: AppFonts.gotham400,
        ),
      ),
    );
  }
}

Color? _getColor(int index) {
  if (index == 12) return Color(0xffEDC6B5);
  if (index == 13) return Color(0xffEDC6B5);
  return null;
}

Color _getBorderColor(int index) {
  if (index == 1) return Color(0xffF3AA03);
  if (index == 2) return Color(0xffF3AA03);
  if (index == 3) return Color(0xffF3AA03);
  if (index == 4) return Color(0xffF3AA03);
  if (index == 5) return Color(0xffF3AA03);
  if (index == 6) return Color(0xff007AFF);
  if (index == 7) return Color(0xff007AFF);
  if (index == 8) return Color(0xff007AFF);
  if (index == 9) return Color(0xff007AFF);
  if (index == 11) return Color(0xff007AFF);
  if (index == 12) return Color(0xffEDC6B5);
  if (index == 13) return Color(0xffEDC6B5);
  if (index == 14) return Color(0xffF3AA03);
  if (index == 15) return Color(0xffF3AA03);
  return Colors.black;
}

double _getBorderRadius(int index) {
  if (index == 1) return 30;
  if (index == 2) return 30;
  if (index == 3) return 30;
  if (index == 4) return 30;
  if (index == 5) return 30;
  if (index == 12) return 30;
  if (index == 13) return 30;
  if (index == 14) return 30;
  if (index == 15) return 30;
  return 0;
}
