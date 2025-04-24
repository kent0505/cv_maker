import 'package:flutter/material.dart';

import '../../../../core/models/data.dart';
import 'widgets/template_about.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_name.dart';
import 'widgets/template_skills.dart';

class Template12 extends StatelessWidget {
  const Template12({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TemplateName(data: data),
                    // contacts
                  ],
                ),
              ),
              TemplateImage(data: data),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xffEDC6B5).withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  TemplateAbout(data: data),
                  Expanded(
                    child: Column(
                      children: [
                        // educations
                        // languages
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        TemplateSkills(data: data),
                        TemplateInterests(data: data),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
