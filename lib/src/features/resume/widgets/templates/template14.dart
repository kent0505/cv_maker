import 'package:flutter/material.dart';

import '../../../../core/models/data.dart';
import 'widgets/template_about.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_name.dart';
import 'widgets/template_skills.dart';

class Template14 extends StatelessWidget {
  const Template14({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 220,
          color: const Color(0xff333333),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TemplateImage(data: data),
              // contact me
              // education
              // languages
            ],
          ),
        ),
        Container(
          width: 330,
          color: Colors.white,
          child: Column(
            children: [
              TemplateName(data: data),
              TemplateAbout(data: data),
              // experience
              TemplateSkills(data: data),
              TemplateInterests(data: data),
            ],
          ),
        ),
      ],
    );
  }
}
