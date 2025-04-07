import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/config/constants.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/image_widget.dart';
import '../../../core/widgets/svg_widget.dart';
import '../provider/resume_provider.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ResumeProvider>(context);

    return SizedBox(
      height: 126,
      width: 118,
      child: Stack(
        children: [
          FileImageWidget(
            provider.imagePath,
            height: 118,
            width: 118,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(35),
          ),
          Positioned(
            right: 5,
            bottom: 0,
            child: Button(
              onPressed: provider.pickImage,
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
