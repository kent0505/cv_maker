import 'package:flutter/material.dart';

class ResumeIndicator extends StatelessWidget {
  const ResumeIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        _Indicator(active: true),
        const SizedBox(width: 5),
        _Indicator(active: false),
        const SizedBox(width: 5),
        _Indicator(active: false),
        const SizedBox(width: 5),
        _Indicator(active: false),
        const SizedBox(width: 5),
        _Indicator(active: false),
        const SizedBox(width: 5),
        _Indicator(active: false),
        const SizedBox(width: 5),
        _Indicator(active: false),
        const SizedBox(width: 5),
        _Indicator(active: false),
        const SizedBox(width: 5),
        _Indicator(active: false),
        const SizedBox(width: 5),
        _Indicator(active: false),
        const SizedBox(width: 16),
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
