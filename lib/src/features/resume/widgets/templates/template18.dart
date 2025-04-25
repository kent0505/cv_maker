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

class Template18 extends StatelessWidget {
  const Template18({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final resume = data.resume!;

    return Column(
      children: [
        Container(
          height: 200,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: 330,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    _Name(
                      name: resume.name,
                      job: resume.job,
                    ),
                    Container(
                      height: 5,
                      width: 60,
                      margin: const EdgeInsets.only(
                        left: 30,
                        top: 6,
                      ),
                      color: const Color(0xff007AFF),
                    ),
                    const SizedBox(height: 20),
                    _About(title: resume.about),
                  ],
                ),
              ),
              Container(
                width: 200,
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _Contact(
                      title: 'Phone',
                      data: resume.phone,
                      asset: Assets.phone,
                    ),
                    _Contact(
                      title: 'E-mail',
                      data: resume.email,
                      asset: Assets.email,
                    ),
                    _Contact(
                      title: 'Address',
                      data: resume.city,
                      asset: Assets.location,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TemplateImage(data: data),
                      const SizedBox(height: 20),
                      if (data.educations.isNotEmpty) ...[
                        _Title(l.education),
                        const SizedBox(height: 6),
                        Container(
                          height: 5,
                          width: 60,
                          color: const Color(0xff007AFF),
                        ),
                        const SizedBox(height: 10),
                        ...List.generate(
                          data.educations.length,
                          (index) {
                            return _Education(
                              education: data.educations[index],
                            );
                          },
                        ),
                      ],
                      const Spacer(),
                      Container(
                        height: 20,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      if (data.experiences.isNotEmpty) ...[
                        Row(
                          children: [
                            _Title(l.jobExperience),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Container(
                                height: 0.5,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                        const SizedBox(height: 10),
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
                        const SizedBox(height: 10),
                        TemplateSkills(data: data),
                        const SizedBox(height: 20),
                      ],
                      if (data.interests.isNotEmpty) ...[
                        _Title(l.interests),
                        const SizedBox(height: 10),
                        TemplateInterests(data: data),
                        const SizedBox(height: 20),
                      ],
                      if (data.languages.isNotEmpty) ...[
                        _Title(l.languages),
                        const SizedBox(height: 10),
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
              ],
            ),
          ),
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
    return Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: AppFonts.gotham400,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
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
          const SizedBox(height: 8),
          Text(
            job.toUpperCase(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
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
    required this.title,
    required this.data,
    required this.asset,
  });

  final String title;
  final String data;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontFamily: AppFonts.gotham900,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
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
            ],
          ),
        ],
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
        const SizedBox(height: 14),
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
        ),
      ),
    );
  }
}
