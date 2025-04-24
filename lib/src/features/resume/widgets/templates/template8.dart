import 'package:flutter/material.dart';

import '../../../../core/models/data.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_skills.dart';

class Template8 extends StatelessWidget {
  const Template8({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 220,
          color: const Color(0xffEEEEEE),
          child: Stack(
            children: [
              Container(
                height: 100,
                width: 220,
                margin: const EdgeInsets.only(top: 60),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff007AFF),
                      Color(0xff084476),
                    ],
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 220,
                color: Colors.white,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  TemplateImage(data: data),
                  const SizedBox(height: 10),
                  // education
                  // languages
                  // contacts
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
                height: 100,
                width: 330,
                margin: const EdgeInsets.only(top: 60),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff007AFF),
                      Color(0xff084476),
                    ],
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 330,
                color: Colors.white,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  // TemplateName(data: data),
                  // TemplateAbout(data: data),
                  Spacer(),
                  // experience
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
