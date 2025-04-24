import 'package:flutter/material.dart';

import '../../../../core/models/data.dart';
import 'widgets/template_about.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_name.dart';
import 'widgets/template_skills.dart';

class Template19 extends StatelessWidget {
  const Template19({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 220,
          color: const Color(0xffF1F1F1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              TemplateName(data: data),
              TemplateImage(data: data),
              Expanded(
                child: Container(
                  color: const Color(0xffF2C52B),
                ),
              ),
              // job
              // educations
              // contacts
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
              // languages
            ],
          ),
        ),
      ],
    );
  }
}
