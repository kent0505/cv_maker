import 'package:flutter/material.dart';

import '../../../../../core/models/data.dart';
import '../../../../../core/widgets/image_widget.dart';

class TemplateImage extends StatelessWidget {
  const TemplateImage({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    final index = data.resume!.template;
    final resume = data.resume!;
    final height = getHeight(index);
    final width = getWidth(index);
    final borderRadius = getBorderRadius(height, index);

    return resume.photo.isEmpty
        ? SizedBox(height: height)
        : Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: borderRadius,
                border: getBorder(index),
                boxShadow: index == 10
                    ? [
                        BoxShadow(
                          blurRadius: 0,
                          color: Color(0xffF9B134),
                          spreadRadius: 0,
                          offset: Offset(-6, 16),
                        ),
                      ]
                    : null,
              ),
              child: FileImageWidget(
                resume.photo,
                height: height,
                width: width,
                fit: BoxFit.cover,
                borderRadius: borderRadius,
              ),
            ),
          );
  }
}

double getHeight(int index) {
  if (index == 2) return 160;
  if (index == 3) return 160;
  if (index == 4) return 160;
  if (index == 5) return 160;

  if (index == 6) return 100;
  if (index == 7) return 160;
  if (index == 8) return 160;
  if (index == 9) return 180;
  if (index == 10) return 140;

  if (index == 11) return 200;
  if (index == 12) return 100;
  if (index == 13) return 160;
  if (index == 14) return 260;
  if (index == 15) return 160;

  if (index == 17) return 130;
  if (index == 18) return 260;
  if (index == 19) return 260;
  if (index == 20) return 300;
  return 160;
}

double getWidth(int index) {
  if (index == 2) return 160;
  if (index == 3) return 160;
  if (index == 4) return 160;
  if (index == 5) return 160;

  if (index == 6) return 100;
  if (index == 7) return 120;
  if (index == 8) return 120;
  if (index == 9) return 140;
  if (index == 10) return 140;

  if (index == 11) return 180;
  if (index == 12) return 100;
  if (index == 13) return 160;
  if (index == 14) return 220;
  if (index == 15) return 160;

  if (index == 17) return 120;
  if (index == 18) return 220;
  if (index == 19) return 220;
  if (index == 20) return 220;
  return 160;
}

BoxBorder? getBorder(int index) {
  if (index == 10 ||
      index == 12 ||
      index == 14 ||
      index == 15 ||
      index == 17 ||
      index == 18 ||
      index == 19 ||
      index == 20) {
    return null;
  } else {
    return Border.all(
      width: index == 9 ? 9 : 3,
      color: index == 6 ? Color(0xff007AFF) : Colors.white,
    );
  }
}

BorderRadiusGeometry getBorderRadius(
  double imageSize,
  int index,
) {
  if (index == 1 || index == 2) {
    return BorderRadius.only(
      topLeft: Radius.circular(imageSize),
      topRight: Radius.circular(imageSize),
      bottomRight: Radius.circular(imageSize),
    );
  }
  if (index == 5) {
    return BorderRadius.only(
      topRight: Radius.circular(imageSize),
      bottomRight: Radius.circular(imageSize),
    );
  }
  if (index == 9) {
    return BorderRadius.only(
      bottomLeft: Radius.circular(imageSize),
      bottomRight: Radius.circular(imageSize),
    );
  }
  if (index == 10 || index == 15) {
    return BorderRadius.circular(20);
  }
  if (index == 11) {
    return BorderRadius.only(
      topRight: Radius.circular(40),
      bottomLeft: Radius.circular(40),
    );
  }

  if (index == 14 || index == 17 || index == 18 || index == 19 || index == 20) {
    return BorderRadius.circular(0);
  }
  return BorderRadius.circular(imageSize);
}
