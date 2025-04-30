import 'package:flutter/material.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/models/data.dart';
import '../../../../core/models/education.dart';
import '../../../../core/models/experience.dart';
import '../../../../core/models/language.dart';
import '../../../../core/utils.dart';
import '../../../../core/widgets/svg_widget.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_skills.dart';

class Template16 extends StatelessWidget {
  const Template16({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final resume = data.resume!;

    return Column(
      children: [
        _Name(
          name: resume.name,
          job: resume.job,
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: resume.about.isEmpty
                ? [
                    const SizedBox(height: 10),
                  ]
                : [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 0.5,
                            margin: const EdgeInsets.only(right: 6),
                            color: Colors.black,
                          ),
                        ),
                        _Title(l.aboutMe),
                        Expanded(
                          child: Container(
                            height: 0.5,
                            margin: const EdgeInsets.only(left: 6),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    _About(title: resume.about),
                    const SizedBox(height: 20),
                  ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Container(
                width: 230,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (data.educations.isNotEmpty) ...[
                      Row(
                        children: [
                          _Title(
                            l.education,
                            line: true,
                          ),
                          Expanded(
                            child: Container(
                              height: 0.5,
                              margin: const EdgeInsets.only(left: 6),
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
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
                      Row(
                        children: [
                          _Title(l.languages),
                          Expanded(
                            child: Container(
                              height: 0.5,
                              margin: const EdgeInsets.only(left: 6),
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      ...List.generate(
                        data.languages.length,
                        (index) {
                          return _Language(
                            language: data.languages[index],
                          );
                        },
                      ),
                    ],
                    Row(
                      children: [
                        _Title(l.contacts),
                        Expanded(
                          child: Container(
                            height: 0.5,
                            margin: const EdgeInsets.only(left: 6),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    _Contact(
                      data: resume.phone,
                      asset: Assets.phone,
                    ),
                    const SizedBox(height: 10),
                    _Contact(
                      data: resume.email,
                      asset: Assets.email,
                    ),
                    const SizedBox(height: 10),
                    _Contact(
                      data: resume.city,
                      asset: Assets.location,
                    ),
                  ],
                ),
              ),
              Container(
                width: 320,
                color: Colors.white,
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (data.experiences.isNotEmpty) ...[
                      Row(
                        children: [
                          _Title(
                            l.jobExperience,
                            line: true,
                            right: 20,
                          ),
                          Expanded(
                            child: Container(
                              height: 0.5,
                              margin: const EdgeInsets.only(left: 6),
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      ...List.generate(
                        data.experiences.length,
                        (index) {
                          return _Experience(
                            experience: data.experiences[index],
                          );
                        },
                      ),
                    ],
                    if (data.skills.isNotEmpty) ...[
                      _Title(l.skills),
                      TemplateSkills(data: data),
                      const SizedBox(height: 20),
                    ],
                    if (data.interests.isNotEmpty) ...[
                      _Title(l.interests),
                      TemplateInterests(data: data),
                      const SizedBox(height: 10),
                    ],
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

class _Title extends StatelessWidget {
  const _Title(
    this.title, {
    this.line = false,
    this.right = 0,
  });

  final String title;
  final bool line;
  final double right;

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
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontFamily: AppFonts.gotham400,
              height: 1,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            job.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: AppFonts.gotham400,
            ),
          ),
        ],
      ),
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
        const SizedBox(height: 14),
      ],
    );
  }
}

class _Contact extends StatelessWidget {
  const _Contact({
    required this.data,
    required this.asset,
  });

  final String data;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgWidget(
          asset,
          height: 12,
          color: Colors.black,
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            data,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontFamily: AppFonts.gotham400,
            ),
          ),
        ),
      ],
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
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black,
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
            color: Colors.black,
            fontSize: 10,
            fontFamily: AppFonts.gotham400,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          '${education.startYear} - ${education.endYear}',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontFamily: AppFonts.gotham400,
          ),
        ),
        const SizedBox(height: 10),
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
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        '${language.language} - ${language.level}',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontFamily: AppFonts.gotham900,
          fontWeight: FontWeight.w900,
          height: 1,
        ),
      ),
    );
  }
}
