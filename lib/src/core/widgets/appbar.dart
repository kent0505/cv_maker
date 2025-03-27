import 'package:flutter/material.dart';

import '../config/my_colors.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({
    super.key,
    this.title = '',
    this.right,
    this.child,
  });

  final String title;
  final Widget? right;
  final Widget? child;

  @override
  Size get preferredSize => const Size.fromHeight(52);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<MyColors>()!;

    return Container(
      height: 54 + MediaQuery.of(context).viewPadding.top,
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
    );
  }
}
