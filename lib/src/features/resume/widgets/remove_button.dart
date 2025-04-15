import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';

class RemoveButton extends StatelessWidget {
  const RemoveButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: const Color(0xffFD9191),
          borderRadius: BorderRadius.circular(6),
        ),
        child: const Center(
          child: SvgWidget(
            Assets.close,
            height: 20,
          ),
        ),
      ),
    );
  }
}
