import 'package:flutter/material.dart';

import '../../../../../core/config/constants.dart';
import '../../../../../core/models/data.dart';

class TemplateName extends StatelessWidget {
  const TemplateName({
    super.key,
    required this.data,
    this.left = 0,
    this.right = 0,
  });

  final Data data;
  final double left;
  final double right;

  @override
  Widget build(BuildContext context) {
    final resume = data.resume!;
    final index = resume.template;

    return Padding(
      padding: EdgeInsets.only(
        left: left,
        right: right,
      ),
      child: Text(
        resume.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: _getNameColor(index),
          fontSize: _getNameSize(index),
          fontFamily: _getNameFamily(index),
        ),
      ),
    );
  }
}

Color _getNameColor(int index) {
  if (index == 2) return Colors.white;
  if (index == 3) return Color(0xff333333);
  if (index == 8) return Colors.white;
  if (index == 14) return Color(0xff333333);
  if (index == 15) return Color(0xff333333);
  if (index == 16) return Colors.white;
  if (index == 17) return Colors.white;
  if (index == 20) return Colors.white;
  return Colors.black;
}

double _getNameSize(int index) {
  if (index == 2) return 20;
  if (index == 3) return 20;
  if (index == 4) return 20;
  if (index == 13) return 22;
  if (index == 14) return 20;
  if (index == 16) return 28;
  if (index == 17) return 28;
  return 24;
}

String _getNameFamily(int index) {
  if (index == 10) return AppFonts.gotham700;
  if (index == 12) return AppFonts.gotham700;
  if (index == 13) return AppFonts.gotham700;
  if (index == 16) return AppFonts.gotham400;
  return AppFonts.gotham900;
}
