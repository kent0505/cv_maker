import 'package:flutter/material.dart';

import '../../../../core/models/data.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_skills.dart';

class Template6 extends StatelessWidget {
  const Template6({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          color: Colors.white,
        ),
        Container(
          width: 200,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 30,
                height: 60,
                color: Color(0xff007AFF),
              ),
              Spacer(),
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //
                    ],
                  ),
                ),
              ),
              Spacer(),
              Container(
                width: 30,
                height: 90,
                color: Color(0xff007AFF),
              ),
            ],
          ),
        ),
        Container(
          width: 320,
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                children: [
                  TemplateImage(data: data),
                  const Spacer(),
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
