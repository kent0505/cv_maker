import 'package:flutter/material.dart';

import '../../../../core/models/data.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_skills.dart';

class Template4 extends StatelessWidget {
  const Template4({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          color: Colors.white,
        ),
        Container(
          width: 200,
          color: const Color(0xffD2E8E6),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TemplateImage(data: data),
              // data
            ],
          ),
        ),
        Container(
          width: 20,
          color: Colors.white,
        ),
        Container(
          width: 1,
          color: const Color(0xff333333),
        ),
        Container(
          width: 309,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // data
              const SizedBox(height: 20),
              const Spacer(),
              TemplateSkills(data: data),
              TemplateInterests(data: data),
            ],
          ),
        ),
      ],
    );
  }
}
