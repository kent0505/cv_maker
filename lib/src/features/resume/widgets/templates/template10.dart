import 'package:flutter/material.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/models/data.dart';
import '../../../../core/widgets/svg_widget.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_skills.dart';

class Template10 extends StatelessWidget {
  const Template10({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 330,
          color: Colors.white,
          child: Stack(
            children: [
              const SvgWidget(
                Assets.figure1,
                height: 120,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TemplateName(data: data),
                  // contacts
                  // TemplateAbout(data: data),
                  TemplateSkills(data: data),
                  // educations
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 220,
          color: Colors.white,
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.bottomRight,
                child: SvgWidget(
                  Assets.figure2,
                  height: 140,
                ),
              ),
              Positioned(
                bottom: 60,
                child: SizedBox(
                  width: 12,
                  height: 500,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          height: 500,
                          width: 2,
                          color: const Color(0xffF9B134),
                        ),
                      ),
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xffF9B134),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xffF9B134),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xffF9B134),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  TemplateImage(data: data),
                  // languages
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
