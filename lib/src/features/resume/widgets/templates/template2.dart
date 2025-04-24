import 'package:flutter/material.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/models/data.dart';
import 'widgets/template_about.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_job.dart';
import 'widgets/template_name.dart';
import 'widgets/template_skills.dart';

class Template2 extends StatelessWidget {
  const Template2({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Row(
      children: [
        Container(
          width: 220,
          color: const Color(0xffF3AA03),
          child: Stack(
            children: [
              Container(
                width: 1,
                margin: const EdgeInsets.only(left: 27),
                color: Colors.white,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  TemplateImage(data: data),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const SizedBox(width: 25.5),
                      Container(
                        height: 40,
                        width: 4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            TemplateName(
                              data: data,
                              left: 8,
                              right: 5,
                            ),
                            const SizedBox(height: 6),
                            TemplateJob(
                              data: data,
                              left: 8,
                              right: 5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _LeftTitle(l.contactMe),
                  // contact me
                  const SizedBox(height: 20),
                  _LeftTitle(l.education),
                  // educations
                  const SizedBox(height: 20),
                  _LeftTitle(l.languages),
                  // languages
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
                width: 1,
                margin: const EdgeInsets.only(left: 27),
                color: const Color(0xff333333),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _RightTitle(l.aboutMe),
                  const SizedBox(height: 6),
                  TemplateAbout(
                    data: data,
                    left: 37.5,
                    right: 5,
                  ),

                  const SizedBox(height: 20),
                  _RightTitle(l.jobExperience),
                  // experiences
                  Spacer(),
                  const SizedBox(height: 20),
                  _RightTitle(l.skills),
                  const SizedBox(height: 6),
                  TemplateSkills(
                    data: data,
                    left: 37.5,
                  ),
                  const SizedBox(height: 20),
                  _RightTitle(l.interests),
                  const SizedBox(height: 6),
                  TemplateInterests(
                    data: data,
                    left: 37.5,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LeftTitle extends StatelessWidget {
  const _LeftTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 25.5),
        Container(
          height: 30,
          width: 4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: AppFonts.gotham900,
          ),
        ),
      ],
    );
  }
}

class _RightTitle extends StatelessWidget {
  const _RightTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 25.5),
        Container(
          height: 30,
          width: 4,
          decoration: BoxDecoration(
            color: const Color(0xffF3AA03),
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: AppFonts.gotham900,
          ),
        ),
      ],
    );
  }
}
