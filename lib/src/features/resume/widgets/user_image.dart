import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/image_widget.dart';
import '../../../core/widgets/svg_widget.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
    required this.controller,
    required this.onPressed,
  });

  final TextEditingController controller;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 126,
      width: 118,
      child: Stack(
        children: [
          FileImageWidget(
            controller.text,
            height: 118,
            width: 118,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(35),
          ),
          Positioned(
            right: 5,
            bottom: 0,
            child: Button(
              onPressed: onPressed,
              minSize: 35,
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Center(
                  child: SvgWidget(Assets.edit),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
