import 'package:flutter/material.dart';

import '../bloc/resume_bloc.dart';

class ResumeIndicator extends StatelessWidget {
  const ResumeIndicator({super.key, required this.stage});

  final Stage stage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Indicator(active: stage == Stage.information),
        const SizedBox(width: 5),
        _Indicator(active: stage == Stage.language),
        const SizedBox(width: 5),
        _Indicator(active: stage == Stage.education),
        const SizedBox(width: 5),
        _Indicator(active: stage == Stage.experience),
        const SizedBox(width: 5),
        _Indicator(active: stage == Stage.projects),
        const SizedBox(width: 5),
        _Indicator(active: stage == Stage.skills),
        const SizedBox(width: 5),
        _Indicator(active: stage == Stage.software),
        const SizedBox(width: 5),
        _Indicator(active: stage == Stage.interests),
        const SizedBox(width: 5),
        _Indicator(active: stage == Stage.honors),
        const SizedBox(width: 5),
        _Indicator(active: stage == Stage.about),
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
