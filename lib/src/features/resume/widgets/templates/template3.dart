import 'package:flutter/material.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/models/data.dart';
import 'widgets/template_about.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_job.dart';
import 'widgets/template_name.dart';
import 'widgets/template_skills.dart';

class Template3 extends StatelessWidget {
  const Template3({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 220,
          color: const Color(0xff333333),
          child: Stack(
            children: [
              Container(
                height: 160,
                width: 220,
                color: const Color(0xffD9D9D9),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      TemplateName(
                        data: data,
                        left: 20,
                        right: 20,
                      ),
                      const SizedBox(height: 6),
                      TemplateJob(
                        data: data,
                        left: 20,
                        right: 20,
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  TemplateImage(data: data),
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
                height: 160,
                width: 330,
                color: const Color(0xffD9D9D9),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 160,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          _RightTitle(l.aboutMe),
                          const SizedBox(height: 6),
                          TemplateAbout(
                            data: data,
                            maxLines: 9,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    _RightTitle(l.jobExperience),
                    // experiences
                    Spacer(),
                    const SizedBox(height: 20),
                    _RightTitle(l.skills),
                    const SizedBox(height: 6),
                    TemplateSkills(data: data),
                    const SizedBox(height: 20),
                    _RightTitle(l.interests),
                    const SizedBox(height: 6),
                    TemplateInterests(data: data),
                    const SizedBox(height: 20),
                  ],
                ),
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
        Container(
          height: 30,
          width: 4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: AppFonts.gotham900,
              fontWeight: FontWeight.w900,
              height: 1,
            ),
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
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
