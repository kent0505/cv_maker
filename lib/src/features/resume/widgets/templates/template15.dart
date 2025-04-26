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

class Template15 extends StatelessWidget {
  const Template15({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final resume = data.resume!;

    return Row(
      children: [
        Container(
          width: 330,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _Name(
                name: resume.name,
                job: resume.job,
              ),
              const SizedBox(height: 20),
              if (resume.about.isNotEmpty) ...[
                _About(
                  title: l.aboutMe,
                  data: resume.about,
                ),
                const SizedBox(height: 20),
              ],
              if (data.experiences.isNotEmpty) ...[
                _LeftTitle(l.jobExperience),
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
                _LeftTitle(l.skills),
                TemplateSkills(
                  data: data,
                  left: 30,
                ),
                const SizedBox(height: 10),
              ],
              if (data.interests.isNotEmpty) ...[
                _LeftTitle(l.interests),
                TemplateInterests(
                  data: data,
                  left: 30,
                ),
                const SizedBox(height: 10),
              ],
            ],
          ),
        ),
        Container(
          width: 220,
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffF9B134),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            margin: const EdgeInsets.only(
              top: 20,
              right: 20,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                TemplateImage(data: data),
                const SizedBox(height: 20),
                _RightTitle(l.contacts),
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
                const SizedBox(height: 20),
                if (data.educations.isNotEmpty) ...[
                  _RightTitle(l.education),
                  ...List.generate(
                    data.educations.length,
                    (index) {
                      return _Education(
                        education: data.educations[index],
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                ],
                if (data.languages.isNotEmpty) ...[
                  _RightTitle(l.languages),
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
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
        left: 30,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: AppFonts.gotham900,
          fontWeight: FontWeight.w900,
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: AppFonts.gotham700,
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
      margin: const EdgeInsets.only(
        left: 30,
        right: 14,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xff333333),
              fontSize: 24,
              fontFamily: AppFonts.gotham900,
              fontWeight: FontWeight.w900,
              height: 1,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            job.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xff333333),
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
  const _About({
    required this.title,
    required this.data,
  });

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30),
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        color: Color(0xff187D97),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: AppFonts.gotham900,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            data,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontFamily: AppFonts.gotham400,
            ),
          ),
        ],
      ),
    );
  }
}

class _Experience extends StatelessWidget {
  const _Experience({required this.experience});

  final Experience experience;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 30),
        Expanded(
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
              const SizedBox(height: 10),
            ],
          ),
        ),
        const SizedBox(width: 14),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  education.name,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Language extends StatelessWidget {
  const _Language({required this.language});

  final Language language;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
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
