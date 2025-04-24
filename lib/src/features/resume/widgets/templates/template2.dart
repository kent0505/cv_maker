import 'package:flutter/material.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/models/data.dart';
import '../../../../core/models/education.dart';
import '../../../../core/models/experience.dart';
import '../../../../core/models/language.dart';
import '../../../../core/utils.dart';
import 'widgets/template_image.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_skills.dart';

class Template2 extends StatelessWidget {
  const Template2({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final resume = data.resume!;

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
                  const SizedBox(height: 20),
                  _Name(
                    name: resume.name,
                    job: resume.job,
                  ),
                  const SizedBox(height: 20),
                  _LeftTitle(l.contactMe),
                  const SizedBox(height: 10),
                  _Contact(title: resume.phone),
                  const SizedBox(height: 10),
                  _Contact(title: resume.email),
                  const SizedBox(height: 10),
                  _Contact(title: resume.city),
                  const SizedBox(height: 20),
                  _LeftTitle(l.education),
                  ...List.generate(
                    data.educations.length,
                    (index) {
                      return _Education(
                        education: data.educations[index],
                      );
                    },
                  ),
                  const SizedBox(height: 20),
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
                  _About(title: resume.about),
                  const SizedBox(height: 20),
                  _RightTitle(l.jobExperience),
                  ...List.generate(
                    data.experiences.length,
                    (index) {
                      return _Experience(
                        experience: data.experiences[index],
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  _RightTitle(l.skills),
                  TemplateSkills(
                    data: data,
                    left: 37.5,
                  ),
                  const SizedBox(height: 20),
                  _RightTitle(l.interests),
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
            fontWeight: FontWeight.w900,
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
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
              fontWeight: FontWeight.w900,
            ),
          ),
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
    return Row(
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
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
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
                  color: Colors.white,
                  fontSize: 10,
                  fontFamily: AppFonts.gotham400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}

class _About extends StatelessWidget {
  const _About({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 37.5,
        right: 20,
      ),
      child: Text(
        title,
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontFamily: AppFonts.gotham400,
        ),
      ),
    );
  }
}

class _Experience extends StatelessWidget {
  const _Experience({required this.experience});

  final Experience experience;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final date = stringToDate(experience.endDate);
    final startYear = experience.startDate.split('/')[2];
    final endYear =
        now.day == date.day && now.month == date.month && now.year == date.year
            ? 'Present'
            : experience.endDate.split('/')[2];
    final period = '$startYear - $endYear';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 23.5),
        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xffF3AA03),
          ),
        ),
        const SizedBox(width: 5),
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
                          experience.introduction,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
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
                          style: TextStyle(
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
                    period,
                    style: TextStyle(
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
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                  fontFamily: AppFonts.gotham400,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}

class _Contact extends StatelessWidget {
  const _Contact({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 23.5),
        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontFamily: AppFonts.gotham400,
            ),
          ),
        ),
        const SizedBox(width: 5),
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
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 23.5),
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  education.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: AppFonts.gotham900,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  education.faculty,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: AppFonts.gotham400,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${education.startYear} - ${education.endYear}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: AppFonts.gotham400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
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
      child: Row(
        children: [
          const SizedBox(width: 37.5),
          Expanded(
            child: Text(
              '${language.language} - ${language.level}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontFamily: AppFonts.gotham900,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
