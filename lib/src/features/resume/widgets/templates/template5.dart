import 'package:flutter/material.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/models/data.dart';
import 'widgets/template_about.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_job.dart';
import 'widgets/template_name.dart';
import 'widgets/template_skills.dart';

class Template5 extends StatelessWidget {
  const Template5({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

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
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  TemplateImage(data: data),
                  const SizedBox(height: 20),
                  _LeftTitle(l.contactMe),
                  // contact me
                  const SizedBox(height: 20),
                  _LeftTitle(l.education),
                  // education
                  const SizedBox(height: 20),
                  _LeftTitle(l.languages),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TemplateName(
                data: data,
                left: 30,
                right: 30,
              ),
              const SizedBox(height: 6),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xffF3AA03),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TemplateJob(
                  data: data,
                ),
              ),
              const SizedBox(height: 20),
              _RightTitle(l.aboutMe),
              TemplateAbout(
                data: data,
                left: 30,
                right: 30,
              ),
              const SizedBox(height: 20),
              _RightTitle(l.jobExperience),
              const Spacer(),
              // experience
              const SizedBox(height: 20),
              _RightTitle(l.skills),
              TemplateSkills(
                data: data,
                left: 30,
              ),
              const SizedBox(height: 20),
              _RightTitle(l.interests),
              TemplateInterests(
                data: data,
                left: 30,
              ),
              const SizedBox(height: 20),
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
    return Container(
      margin: const EdgeInsets.only(left: 30),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF3AA03),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xff333333),
          fontSize: 14,
          fontFamily: AppFonts.gotham400,
        ),
      ),
    );
  }
}

class _RightTitle extends StatelessWidget {
  const _RightTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 30,
        bottom: 6,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF3AA03),
        borderRadius: BorderRadius.circular(40),
      ),
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
