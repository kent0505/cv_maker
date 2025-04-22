import 'package:flutter/material.dart';

import '../../../../core/models/data.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_skills.dart';

class Template13 extends StatelessWidget {
  const Template13({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 70,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  // name
                ],
              ),
            ),
            Container(
              height: 100,
              color: const Color(0xffA0A0A0),
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 300,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // about me
                        // experience
                      ],
                    ),
                  ),
                  Container(
                    width: 250,
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        // education
                        // languages
                        TemplateSkills(data: data),
                        TemplateInterests(data: data),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              color: const Color(0xff606060),
              child: Column(
                children: [
                  // contacts
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 40,
          left: 0,
          right: 0,
          child: TemplateImage(data: data),
        ),
      ],
    );
  }
}
