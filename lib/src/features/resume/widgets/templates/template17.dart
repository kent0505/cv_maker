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

class Template17 extends StatelessWidget {
  const Template17({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final resume = data.resume!;

    return Stack(
      children: [
        Container(color: Colors.white),
        Container(
          height: 230,
          color: Colors.black,
        ),
        Row(
          children: [
            Container(
              width: 220,
              padding: const EdgeInsets.only(
                left: 20,
                right: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 100,
                    margin: EdgeInsets.only(left: 80),
                    color: Color(0xffF3AA03),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 120,
                    child: _Name(
                      name: resume.name,
                      job: resume.job,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (resume.about.isNotEmpty) ...[
                    _Title(
                      l.aboutMe,
                      line: true,
                    ),
                    _About(title: resume.about),
                    const SizedBox(height: 20),
                  ],
                  if (data.educations.isNotEmpty) ...[
                    _Title(
                      l.education,
                      line: true,
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
                    _Title(l.languages),
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
            SizedBox(
              width: 330,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  SizedBox(
                    height: 130,
                    child: Row(
                      children: [
                        TemplateImage(data: data),
                        Expanded(
                          child: Column(
                            children: [
                              const Spacer(),
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  if (data.experiences.isNotEmpty) ...[
                    _Title(
                      l.jobExperience,
                      line: true,
                      right: 20,
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
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: AppFonts.gotham400,
            ),
          ),
          if (line) ...[
            const SizedBox(width: 6),
            Expanded(
              child: Container(
                height: 0.5,
                margin: const EdgeInsets.only(top: 5),
                color: Colors.black,
              ),
            ),
            SizedBox(width: right),
          ],
        ],
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
            color: Colors.white,
            fontSize: 36,
            fontFamily: AppFonts.gotham900,
            fontWeight: FontWeight.w900,
            height: 1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          job.toUpperCase(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: AppFonts.gotham400,
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
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
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
      ),
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
        const SizedBox(width: 20),
        SvgWidget(
          asset,
          height: 12,
          color: Colors.white,
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            data,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontFamily: AppFonts.gotham400,
            ),
          ),
        ),
        const SizedBox(width: 20),
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
      padding: const EdgeInsets.only(bottom: 6),
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
