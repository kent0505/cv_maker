import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';

class FieldTitle extends StatelessWidget {
  const FieldTitle(
    this.title, {
    super.key,
    this.center = false,
  });

  final String title;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return center
        ? Text(
            title,
            style: TextStyle(
              color: const Color(0xff3C3C43).withValues(alpha: 0.6),
              fontSize: 14,
              fontFamily: AppFonts.funnel400,
            ),
          )
        : Row(
            children: [
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  color: const Color(0xff3C3C43).withValues(alpha: 0.6),
                  fontSize: 14,
                  fontFamily: AppFonts.funnel400,
                ),
              ),
            ],
          );
  }
}
