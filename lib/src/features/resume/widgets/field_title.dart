import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';

class FieldTitle extends StatelessWidget {
  const FieldTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 16),
        Text(
          title,
          style: TextStyle(
            color: Color(0xff3C3C43).withValues(alpha: 0.6),
            fontSize: 14,
            fontFamily: AppFonts.funnel400,
          ),
        ),
      ],
    );
  }
}
