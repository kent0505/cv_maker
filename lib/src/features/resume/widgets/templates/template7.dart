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

class Template7 extends StatelessWidget {
  const Template7({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final resume = data.resume!;

    return Row(
      children: [
        Container(
          width: 220,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: const [
                Color(0xff007AFF),
                Color(0xff084476),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              TemplateImage(data: data),
              const SizedBox(height: 20),
              if (data.educations.isNotEmpty) ...[
                _LeftTitle(l.education),
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
              _LeftTitle(l.contacts),
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
        ),
        Container(
          width: 330,
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              _Name(
                name: resume.name,
                job: resume.job,
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
              ],
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
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xff333333),
          fontSize: 16,
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
  const _Contact({
    required this.title,
    required this.asset,
  });

  final String title;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            education.name,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
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
          const SizedBox(height: 20),
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
      padding: const EdgeInsets.only(
        bottom: 14,
        left: 20,
      ),
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
    );
  }
}
