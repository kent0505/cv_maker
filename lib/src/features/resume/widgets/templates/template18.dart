import 'package:flutter/material.dart';

import '../../../../core/models/data.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_skills.dart';

class Template18 extends StatelessWidget {
  const Template18({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 230,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: 330,
                child: Column(
                  children: [
                    // name
                    // about
                  ],
                ),
              ),
              Container(
                width: 200,
                color: Colors.black,
                child: Column(
                  children: [
                    // contacts
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                SizedBox(
                  width: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TemplateImage(data: data),
                      // educations
                      // languages
                      const Spacer(),
                      Container(
                        height: 20,
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 330,
                  child: Column(
                    children: [
                      // experiences
                      const Spacer(),
                      TemplateSkills(data: data),
                      TemplateInterests(data: data),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
