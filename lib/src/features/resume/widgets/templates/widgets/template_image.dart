import 'package:flutter/material.dart';

import '../../../../../core/models/data.dart';
import '../../../../../core/widgets/image_widget.dart';

class TemplateImage extends StatelessWidget {
  const TemplateImage({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    final imageSize = 160.0;
    final index = data.resume!.template;

    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: getBorderRadius(imageSize, index),
          border: Border.all(
            width: 3,
            color: index == 6 ? Color(0xff007AFF) : Colors.white,
          ),
        ),
        child: FileImageWidget(
          data.resume!.photo,
          height: imageSize,
          width: imageSize,
          fit: BoxFit.cover,
          borderRadius: getBorderRadius(imageSize, index),
        ),
      ),
    );
  }
}

BorderRadiusGeometry getBorderRadius(
  double imageSize,
  int index,
) {
  double radius = imageSize / 2;
  if (index == 1 || index == 2) {
    return BorderRadius.only(
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
      bottomRight: Radius.circular(radius),
    );
  }
  if (index == 5) {
    return BorderRadius.only(
      topRight: Radius.circular(radius),
      bottomRight: Radius.circular(radius),
    );
  }
  return BorderRadius.circular(radius);
}
