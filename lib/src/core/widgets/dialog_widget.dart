import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/constants.dart';
import 'button.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.title,
    required this.description,
    required this.onYes,
  });

  final String title;
  final String description;
  final VoidCallback onYes;

  static void show(
    BuildContext context, {
    required String title,
    required String description,
    required void Function() onYes,
  }) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      useSafeArea: false,
      builder: (context) {
        return DialogWidget(
          title: title,
          description: description,
          onYes: onYes,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              color: const Color(0xff808080).withValues(alpha: 0.55),
            ),
          ),
          Container(
            width: 270,
            decoration: BoxDecoration(
              color: const Color(0xffe7e7e7),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: AppFonts.funnel600,
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: AppFonts.funnel400,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  height: 0.5,
                  color: const Color(0xff808080).withValues(alpha: 0.55),
                ),
                Row(
                  children: [
                    _Button(
                      title: l.cancel,
                      color: const Color(0xff007AFF),
                      fontFamily: AppFonts.funnel400,
                      onPressed: () {
                        context.pop();
                      },
                    ),
                    Container(
                      width: 0.5,
                      height: 44,
                      color: const Color(0xff808080).withValues(alpha: 0.55),
                    ),
                    _Button(
                      title: l.yes,
                      color: const Color(0xffFF5656),
                      fontFamily: AppFonts.funnel600,
                      onPressed: () {
                        context.pop();
                        onYes();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.title,
    required this.color,
    required this.fontFamily,
    required this.onPressed,
  });

  final String title;
  final Color color;
  final String fontFamily;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Button(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 16,
                fontFamily: fontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
