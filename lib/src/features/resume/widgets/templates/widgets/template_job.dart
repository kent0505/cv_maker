import 'package:flutter/material.dart';

import '../../../../../core/config/constants.dart';
import '../../../../../core/models/data.dart';

class TemplateJob extends StatelessWidget {
  const TemplateJob({
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
        resume.job.toUpperCase(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: _getJobColor(index),
          fontSize: _getJobSize(index),
          fontFamily: _getJobFamily(index),
        ),
      ),
    );
  }
}

Color _getJobColor(int index) {
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

double _getJobSize(int index) {
  if (index == 1) return 12;
  if (index == 6) return 12;
  if (index == 7) return 12;
  if (index == 8) return 12;
  if (index == 9) return 12;
  if (index == 11) return 12;
  if (index == 12) return 12;
  if (index == 13) return 14;
  if (index == 15) return 14;
  if (index == 16) return 14;
  if (index == 17) return 14;
  if (index == 18) return 12;
  if (index == 19) return 12;
  if (index == 20) return 12;
  return 10;
}

String _getJobFamily(int index) {
  if (index == 19) return AppFonts.gotham900;
  if (index == 20) return AppFonts.gotham900;
  return AppFonts.gotham400;
}
