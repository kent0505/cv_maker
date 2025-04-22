import 'package:flutter/material.dart';

import '../../../../core/models/data.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_skills.dart';

class Template3 extends StatelessWidget {
  const Template3({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 220,
          color: const Color(0xff333333),
          child: Stack(
            children: [
              Container(
                height: 160,
                width: 220,
                color: const Color(0xffD9D9D9),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  // name
                  TemplateImage(data: data),
                  // contact me
                  // educations
                  // languages
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 330,
          color: Colors.white,
          child: Stack(
            children: [
              Container(
                height: 160,
                width: 330,
                color: const Color(0xffD9D9D9),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  // about
                  // experiences
                  TemplateSkills(data: data),
                  TemplateInterests(data: data),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
