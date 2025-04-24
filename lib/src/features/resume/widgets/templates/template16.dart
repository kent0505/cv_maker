import 'package:flutter/material.dart';

import '../../../../core/models/data.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_skills.dart';

class Template16 extends StatelessWidget {
  const Template16({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.black,
          child: Column(
            children: [
              // TemplateName(data: data),
            ],
          ),
        ),
        Container(
          height: 130,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              // TemplateAbout(data: data),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Container(
                width: 230,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // educations
                    // languages
                    // contacts
                  ],
                ),
              ),
              Container(
                width: 320,
                color: Colors.white,
                child: Column(
                  children: [
                    // experiences
                    TemplateSkills(data: data),
                    TemplateInterests(data: data),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
