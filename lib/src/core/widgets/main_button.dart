import 'package:flutter/material.dart';

import '../config/constants.dart';
import 'button.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    this.active = true,
    this.transparent = false,
    this.white = false,
    this.horizontal = 16,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final bool transparent;
  final bool white;
  final double horizontal;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: transparent ? 0 : 500),
      height: 54,
      margin: EdgeInsets.symmetric(horizontal: horizontal),
      decoration: BoxDecoration(
        color: transparent
            ? null
            : white
                ? Colors.white
                : active
                    ? Color(0xff007AFF)
                    : Color(0xff9C9C9C),
        borderRadius: BorderRadius.circular(30),
        border: white
            ? Border.all(
                width: 1,
                color: Color(0xff007AFF),
              )
            : null,
      ),
      child: Button(
        onPressed: active ? onPressed : null,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: transparent
                  ? Color(0xff444444)
                  : white
                      ? Color(0xff007AFF)
                      : Colors.white,
              fontSize: 16,
              fontFamily: AppFonts.funnel700,
            ),
          ),
        ),
      ),
    );
  }
}
