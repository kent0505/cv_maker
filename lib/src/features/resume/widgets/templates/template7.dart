import 'package:flutter/material.dart';

import '../../../../core/models/data.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_skills.dart';

class Template7 extends StatelessWidget {
  const Template7({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 220,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff007AFF),
                Color(0xff084476),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              TemplateImage(data: data),
              // data
            ],
          ),
        ),
        Container(
          width: 330,
          color: Colors.white,
          child: Column(
            children: [
              // data
              const Spacer(),
              TemplateSkills(data: data),
              TemplateInterests(data: data),
            ],
          ),
        ),
      ],
    );
  }
}
