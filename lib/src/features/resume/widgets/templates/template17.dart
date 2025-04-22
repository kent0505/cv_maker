import 'package:flutter/material.dart';

import '../../../../core/models/data.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_skills.dart';

class Template17 extends StatelessWidget {
  const Template17({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.white),
        Container(
          height: 230,
          color: Colors.black,
        ),
        Row(
          children: [
            SizedBox(
              width: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // name
                  // about
                  // education
                  // languages
                ],
              ),
            ),
            SizedBox(
              width: 330,
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Row(
                    children: [
                      TemplateImage(data: data),
                      // contacts
                    ],
                  ),
                  // experience
                  Spacer(),
                  TemplateSkills(data: data),
                  TemplateInterests(data: data),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
