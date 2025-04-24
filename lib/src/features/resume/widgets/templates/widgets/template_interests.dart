import 'package:flutter/material.dart';

import '../../../../../core/config/constants.dart';
import '../../../../../core/models/data.dart';

class TemplateInterests extends StatelessWidget {
  const TemplateInterests({
    super.key,
    required this.data,
    this.left = 0,
  });

  final Data data;
  final double left;

  @override
  Widget build(BuildContext context) {
    final interests = data.interests;
    final template = data.resume!.template;

    return Padding(
      padding: EdgeInsets.only(
        left: left,
        right: 10,
      ),
      child: Wrap(
        runSpacing: 6,
        spacing: 4,
        children: List.generate(
          interests.length,
          (index) {
            return _Card(
              title: interests[index].title,
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
        borderRadius: BorderRadius.circular(_getBorderRadius(index)),
        border: Border.all(
          width: 0.5,
          color: _getBorderColor(index),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 6,
              fontFamily: AppFonts.gotham400,
            ),
          ),
        ],
      ),
    );
  }
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
