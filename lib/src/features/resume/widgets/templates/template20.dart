import 'package:flutter/material.dart';

import '../../../../core/models/data.dart';
import 'widgets/template_about.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_name.dart';
import 'widgets/template_skills.dart';

class Template20 extends StatelessWidget {
  const Template20({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 220,
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              TemplateName(data: data),
              const SizedBox(height: 40),
              TemplateImage(data: data),
              // contacts
              // languages
            ],
          ),
        ),
        Container(
          width: 330,
          color: Colors.white,
          child: Column(
            children: [
              TemplateAbout(data: data),
              // experiences
              const Spacer(),
              TemplateSkills(data: data),
              TemplateInterests(data: data),
              // educations
            ],
          ),
        ),
      ],
    );
  }
}
