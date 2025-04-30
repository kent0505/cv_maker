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

class Template13 extends StatelessWidget {
  const Template13({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final resume = data.resume!;

    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 70,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          resume.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontFamily: AppFonts.gotham700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 100),
                      Expanded(
                        child: Text(
                          resume.job.toUpperCase(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: AppFonts.gotham400,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              color: const Color(0xffA0A0A0),
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 280,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        if (resume.about.isNotEmpty) ...[
                          _Title(l.aboutMe),
                          _About(title: resume.about),
                          const SizedBox(height: 16),
                        ],
                        if (data.experiences.isNotEmpty) ...[
                          _Title(l.jobExperience),
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
                  Container(
                    width: 270,
                    color: Colors.white,
                    padding: EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        if (data.educations.isNotEmpty) ...[
                          _Title(l.education),
                          ...List.generate(
                            data.educations.length,
                            (index) {
                              return _Education(
                                education: data.educations[index],
                              );
                            },
                          ),
                        ],
                        if (data.skills.isNotEmpty) ...[
                          _Title(l.skills),
                          TemplateSkills(
                            data: data,
                            right: 0,
                          ),
                          const SizedBox(height: 10),
                        ],
                        if (data.interests.isNotEmpty) ...[
                          _Title(l.interests),
                          TemplateInterests(
                            data: data,
                            right: 0,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 96,
              width: double.infinity,
              color: const Color(0xff606060),
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l.contacts,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: AppFonts.gotham700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _Contact(
                        title: resume.phone,
                        asset: Assets.phone,
                      ),
                      _Contact(
                        title: resume.email,
                        asset: Assets.email,
                      ),
                      _Contact(
                        title: resume.city,
                        asset: Assets.location,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 40,
          left: 0,
          right: 0,
          child: TemplateImage(data: data),
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(this.title);

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
          fontFamily: AppFonts.gotham700,
        ),
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
                    experience.introduction.toUpperCase(),
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
        const SizedBox(height: 8),
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
          education.name.toUpperCase(),
          maxLines: 3,
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
          education.faculty.toUpperCase(),
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
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        '${language.language} - ${language.level}',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontFamily: AppFonts.gotham700,
        ),
      ),
    );
  }
}

class _Contact extends StatelessWidget {
  const _Contact({
    required this.title,
    required this.asset,
  });

  final String title;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Row(
        children: [
          SvgWidget(
            asset,
            height: 12,
            color: Color(0xffF3AA03),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              title,
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
      ),
    );
  }
}
