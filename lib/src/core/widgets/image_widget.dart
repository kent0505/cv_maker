import 'dart:io';

import 'package:flutter/material.dart';

import '../config/constants.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget(
    this.asset, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
    this.borderRadius = BorderRadius.zero,
  });

  final String asset;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final AlignmentGeometry alignment;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.asset(
        asset,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        frameBuilder: frameBuilder,
        errorBuilder: (context, error, stackTrace) {
          return SizedBox(
            width: width,
            height: height,
          );
        },
      ),
    );
  }
}

class FileImageWidget extends StatelessWidget {
  const FileImageWidget(
    this.asset, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
    this.borderRadius = BorderRadius.zero,
  });

  final String asset;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final AlignmentGeometry alignment;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.file(
        File(asset),
        width: width,
        height: height,
        fit: fit,
        frameBuilder: frameBuilder,
        errorBuilder: (context, error, stackTrace) {
          return ImageWidget(
            Assets.user,
            height: width,
            width: height,
            fit: fit,
          );
        },
      ),
    );
  }
}

Widget frameBuilder(
  BuildContext context,
  Widget child,
  int? frame,
  bool wasSynchronouslyLoaded,
) {
  return AnimatedOpacity(
    opacity: frame == null ? 0.0 : 1.0,
    duration: const Duration(milliseconds: 1000),
    curve: Curves.easeInOut,
    child: child,
  );
}
