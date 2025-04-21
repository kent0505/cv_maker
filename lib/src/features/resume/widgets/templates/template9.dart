import 'package:flutter/material.dart';

import '../../../../core/models/data.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_skills.dart';

class Template9 extends StatelessWidget {
  const Template9({super.key, required this.data});

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
                  color: const Color(0xffF6F6F6),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TemplateImage(data: data),
                  // data
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
