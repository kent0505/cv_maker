import 'package:flutter/material.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/models/data.dart';
import 'widgets/template_about.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_job.dart';
import 'widgets/template_name.dart';
import 'widgets/template_skills.dart';

class Template4 extends StatelessWidget {
  const Template4({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Row(
      children: [
        Container(
          width: 20,
          color: Colors.white,
        ),
        Container(
          width: 200,
          color: const Color(0xffD2E8E6),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TemplateImage(data: data),
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
              const SizedBox(height: 20),
              _LeftTitle(l.contactMe),
              // contact me
              const SizedBox(height: 20),
              _LeftTitle(l.education),
              // education
              const SizedBox(height: 20),
              _LeftTitle(l.languages),
              // languages
            ],
          ),
        ),
        Container(
          width: 20,
          color: Colors.white,
        ),
        Container(
          width: 1,
          color: const Color(0xff333333),
        ),
        Container(
          width: 309,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _RightTitle(l.aboutMe),
              TemplateAbout(
                data: data,
                left: 8,
                right: 8,
              ),
              const _Divider(),
              _RightTitle(l.jobExperience),
              const Spacer(),
              // experiences
              const _Divider(),
              _RightTitle(l.skills),
              TemplateSkills(
                data: data,
                left: 8,
              ),
              const _Divider(),
              _RightTitle(l.interests),
              TemplateInterests(
                data: data,
                left: 8,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 8,
      ),
      color: const Color(0xff333333),
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
        color: Colors.black,
        fontSize: 20,
        fontFamily: AppFonts.gotham900,
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
      child: Row(
        children: [
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: AppFonts.gotham900,
            ),
          ),
        ],
      ),
    );
  }
}
