import 'package:flutter/material.dart';

import '../../../../core/models/data.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_skills.dart';

class Template15 extends StatelessWidget {
  const Template15({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 330,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // name
              // about
              // experience
              TemplateSkills(data: data),
              TemplateInterests(data: data),
            ],
          ),
        ),
        Container(
          width: 220,
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffF9B134),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            margin: const EdgeInsets.only(
              top: 20,
              right: 20,
            ),
            child: Column(
              children: [
                const SizedBox(height: 40),
                TemplateImage(data: data),
                // education
                // contacts
              ],
            ),
          ),
        ),
      ],
    );
  }
}
