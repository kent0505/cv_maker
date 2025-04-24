import 'package:flutter/material.dart';

import '../../../../../core/config/constants.dart';
import '../../../../../core/models/data.dart';

class TemplateAbout extends StatelessWidget {
  const TemplateAbout({
    super.key,
    required this.data,
    this.maxLines = 4,
    this.left = 0,
    this.right = 0,
  });

  final Data data;
  final int maxLines;
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
        resume.about,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: index == 15 ? Colors.white : Colors.black,
          fontSize: 10,
          fontFamily: AppFonts.gotham400,
        ),
      ),
    );
  }
}

// Color _getColor(int index) {
//   if (index == 15) return Colors.white;
//   return Colors.black;
// }

// double getFontSize(int index) {
//   if (index == 1 ) return 10;
//   return 10;
// }
