import 'package:flutter/material.dart';

import '../../../../core/models/data.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_skills.dart';

class Template1 extends StatelessWidget {
  const Template1({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 220,
          color: const Color(0xff333333),
          child: Stack(
            children: [
              Container(
                width: 1,
                margin: const EdgeInsets.only(left: 27),
                color: Colors.white,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  TemplateImage(data: data),
                  // data
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
                height: 80,
                margin: const EdgeInsets.only(top: 30),
                color: const Color(0xffF0F0F0),
              ),
              Container(
                width: 1,
                margin: const EdgeInsets.only(left: 27),
                color: const Color(0xff333333),
              ),
              Column(
                children: [
                  // data
                  const Spacer(),
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
