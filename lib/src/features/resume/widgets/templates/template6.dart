import 'package:flutter/material.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/models/data.dart';
import '../../../../core/models/education.dart';
import '../../../../core/models/experience.dart';
import '../../../../core/models/language.dart';
import '../../../../core/utils.dart';
import '../../../../core/widgets/svg_widget.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_skills.dart';

class Template6 extends StatelessWidget {
  const Template6({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final resume = data.resume!;

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
              _Name(
                name: resume.name,
                job: resume.job,
              ),
              const SizedBox(height: 20),
              if (data.educations.isNotEmpty && data.languages.isNotEmpty)
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
                      if (data.educations.isNotEmpty) ...[
                        _LeftTitle(l.education),
                        const SizedBox(height: 20),
                        ...List.generate(
                          data.educations.length,
                          (index) {
                            return _Education(
                              education: data.educations[index],
                            );
                          },
                        ),
                      ],
                      if (data.languages.isNotEmpty) ...[
                        _LeftTitle(l.languages),
                        ...List.generate(
                          data.languages.length,
                          (index) {
                            return _Language(
                              language: data.languages[index],
                            );
                          },
                        ),
                      ],
                    ],
                  ),
                ),
              const Spacer(),
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 90,
                    color: const Color(0xff007AFF),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgWidget(
                          Assets.phone,
                          height: 12,
                          color: Colors.white,
                        ),
                        SvgWidget(
                          Assets.email,
                          height: 12,
                          color: Colors.white,
                        ),
                        SvgWidget(
                          Assets.location,
                          height: 12,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 90,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _Contact(title: resume.phone),
                          _Contact(title: resume.email),
                          _Contact(title: resume.city),
                        ],
                      ),
                    ),
                  )
                ],
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
                  if (resume.about.isNotEmpty) ...[
                    _RightTitle(l.aboutMe),
                    _About(title: resume.about),
                    const SizedBox(height: 20),
                  ],
                  if (data.experiences.isNotEmpty) ...[
                    _RightTitle(l.jobExperience),
                    ...List.generate(
                      data.experiences.length,
                      (index) {
                        return _Experience(
                          experience: data.experiences[index],
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                  if (data.skills.isNotEmpty) ...[
                    _RightTitle(l.skills),
                    TemplateSkills(data: data),
                    const SizedBox(height: 20),
                  ],
                  if (data.interests.isNotEmpty) ...[
                    _RightTitle(l.interests),
                    TemplateInterests(data: data),
                    const SizedBox(height: 20),
                  ],
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
      padding: const EdgeInsets.only(bottom: 10),
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

class _Name extends StatelessWidget {
  const _Name({
    required this.name,
    required this.job,
  });

  final String name;
  final String job;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: AppFonts.gotham900,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: EdgeInsets.all(10),
          color: Color(0xffD9D9D9),
          child: Text(
            job.toUpperCase(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: AppFonts.gotham400,
            ),
          ),
        ),
      ],
    );
  }
}

class _About extends StatelessWidget {
  const _About({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 10,
        fontFamily: AppFonts.gotham400,
      ),
    );
  }
}

class _Experience extends StatelessWidget {
  const _Experience({required this.experience});

  final Experience experience;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    experience.introduction,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: AppFonts.gotham900,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${experience.introduction} / ${experience.location}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 6,
                      fontFamily: AppFonts.gotham700,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 6),
            Text(
              getPeriod(experience),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 8,
                fontFamily: AppFonts.gotham400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          experience.details,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 8,
            fontFamily: AppFonts.gotham400,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _Contact extends StatelessWidget {
  const _Contact({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Color(0xff363636),
        fontSize: 10,
        fontFamily: AppFonts.gotham400,
      ),
    );
  }
}

class _Education extends StatelessWidget {
  const _Education({required this.education});

  final Education education;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          education.name,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Color(0xff333333),
            fontSize: 10,
            fontFamily: AppFonts.gotham700,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          education.faculty,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Color(0xff333333),
            fontSize: 10,
            fontFamily: AppFonts.gotham400,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          '${education.startYear} - ${education.endYear}',
          style: const TextStyle(
            color: Color(0xff333333),
            fontSize: 10,
            fontFamily: AppFonts.gotham400,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _Language extends StatelessWidget {
  const _Language({required this.language});

  final Language language;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        '${language.language} - ${language.level}',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Color(0xff333333),
          fontSize: 10,
          fontFamily: AppFonts.gotham900,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
