import 'package:flutter/material.dart';

class Bg extends StatelessWidget {
  const Bg({
    super.key,
    required this.child,
    this.topWidgets = const [],
  });

  final Widget child;
  final List<Widget> topWidgets;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Color(0xffC7DDF4),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: topWidgets.isEmpty
          ? child
          : Stack(
              children: topWidgets..insert(0, child),
            ),
    );
  }
}
