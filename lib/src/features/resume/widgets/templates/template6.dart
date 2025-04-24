import 'package:flutter/material.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/models/data.dart';
import 'widgets/template_about.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_job.dart';
import 'widgets/template_name.dart';
import 'widgets/template_skills.dart';

class Template6 extends StatelessWidget {
  const Template6({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

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
                color: const Color(0xff007AFF),
              ),
              const SizedBox(height: 20),
              TemplateName(data: data),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.all(10),
                color: const Color(0xffD9D9D9),
                child: TemplateJob(data: data),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _LeftTitle(l.education),
                    const SizedBox(height: 20),
                    // education
                    _LeftTitle(l.languages),
                    // languages
                  ],
                ),
              ),
              const Spacer(),
              Container(
                width: 30,
                height: 90,
                color: const Color(0xff007AFF),
              ),
            ],
          ),
        ),
        Container(
          width: 320,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TemplateImage(data: data),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _RightTitle(l.aboutMe),
                  TemplateAbout(data: data),
                  const SizedBox(height: 20),
                  _RightTitle(l.jobExperience),
                  // experience
                  const Spacer(),
                  _RightTitle(l.skills),
                  TemplateSkills(data: data),
                  const SizedBox(height: 20),
                  _RightTitle(l.interests),
                  TemplateInterests(data: data),
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
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xff333333),
        fontSize: 16,
        fontFamily: AppFonts.gotham400,
      ),
    );
  }
}

class _RightTitle extends StatelessWidget {
  const _RightTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: AppFonts.gotham400,
        ),
      ),
    );
  }
}
