import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/constants.dart';
import 'button.dart';
import 'svg_widget.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({
    super.key,
    required this.title,
    this.left,
    this.right,
  });

  final String title;
  final Widget? left;
  final Widget? right;

  @override
  Size get preferredSize => const Size.fromHeight(62);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62 + MediaQuery.of(context).viewPadding.top,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          left == null
              ? AppbarButton(
                  asset: Assets.left,
                  onPressed: () {
                    context.pop();
                  },
                )
              : left!,
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: AppFonts.funnel600,
              ),
            ),
          ),
          if (left == null && right == null) SizedBox(width: 30),
          if (right != null) right!,
        ],
      ),
    );
  }
}

class AppbarButton extends StatelessWidget {
  const AppbarButton({
    super.key,
    required this.asset,
    required this.onPressed,
  });

  final String asset;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      minSize: 30,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Color(0xffE8E8F2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: SvgWidget(asset),
        ),
      ),
    );
  }
}
