import 'package:flutter/material.dart';

class ResumeIndicator extends StatelessWidget {
  const ResumeIndicator({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Indicator(active: index == 1),
        const SizedBox(width: 5),
        _Indicator(active: index == 2),
        const SizedBox(width: 5),
        _Indicator(active: index == 3),
        const SizedBox(width: 5),
        _Indicator(active: index == 4),
        const SizedBox(width: 5),
        _Indicator(active: index == 5),
        const SizedBox(width: 5),
        _Indicator(active: index == 6),
        const SizedBox(width: 5),
        _Indicator(active: index == 7),
        const SizedBox(width: 5),
        _Indicator(active: index == 8),
        const SizedBox(width: 5),
        _Indicator(active: index == 9),
        const SizedBox(width: 5),
        _Indicator(active: index == 10),
      ],
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: active ? 6 : 1,
      child: Container(
        height: 4,
        decoration: BoxDecoration(
          color: active ? Color(0xff007AFF) : Color(0xffBBDCFF),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
