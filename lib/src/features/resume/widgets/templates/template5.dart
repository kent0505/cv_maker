import 'package:flutter/material.dart';

import '../../../../core/models/data.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_skills.dart';

class Template5 extends StatelessWidget {
  const Template5({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 220,
          color: Colors.white,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                decoration: BoxDecoration(
                  color: const Color(0xffF2F2F2),
                  borderRadius: BorderRadius.only(
                    topRight: const Radius.circular(20),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  TemplateImage(data: data),
                  // contact me
                  // education
                  // language
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 330,
          color: Colors.white,
          child: Column(
            children: [
              // name
              // about
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
