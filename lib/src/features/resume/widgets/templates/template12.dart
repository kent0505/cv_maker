import 'package:flutter/material.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/models/data.dart';
import '../../../../core/models/education.dart';
import '../../../../core/models/language.dart';
import '../../../../core/widgets/image_widget.dart';
import '../../../../core/widgets/svg_widget.dart';
import 'widgets/template_interests.dart';
import 'widgets/template_skills.dart';

class Template12 extends StatelessWidget {
  const Template12({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final resume = data.resume!;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 250,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _Name(
                        name: resume.name,
                        job: resume.job,
                      ),
                      const SizedBox(height: 20),
                      _LeftTitle(l.contacts),
                      const SizedBox(height: 10),
                      _Contact(
                        title: resume.phone,
                        asset: Assets.phone,
                        maxLines: 1,
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
                Positioned(
                  right: 20,
                  bottom: 10,
                  child: FileImageWidget(
                    resume.photo,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ],
            ),
          ),
          if (resume.about.isNotEmpty &&
              data.educations.isNotEmpty &&
              data.languages.isNotEmpty &&
              data.skills.isNotEmpty &&
              data.interests.isNotEmpty)
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xfffaeee9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (resume.about.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(0xffDC9F84),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: _LeftTitle(l.aboutMe),
                      ),
                      const SizedBox(height: 10),
                      _About(title: resume.about),
                      const SizedBox(height: 20.5),
                    ],
                    if (data.educations.isNotEmpty &&
                        data.languages.isNotEmpty &&
                        data.skills.isNotEmpty &&
                        data.interests.isNotEmpty)
                      SizedBox(
                        height: 360,
                        width: 510,
                        child: Stack(
                          children: [
                            const Center(
                              child: SvgWidget(
                                Assets.line2,
                                height: 300,
                              ),
                            ),
                            const Center(
                              child: SvgWidget(
                                Assets.line1,
                                width: 300,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                width: 254,
                                height: 360 / 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
                                    ],
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: SizedBox(
                                width: 254,
                                height: 360 / 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
                            Align(
                              alignment: Alignment.topRight,
                              child: SizedBox(
                                width: 254,
                                height: 360 / 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (data.skills.isNotEmpty) ...[
                                      _RightTitle(l.skills),
                                      TemplateSkills(
                                        data: data,
                                        right: 0,
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: SizedBox(
                                width: 254,
                                height: 360 / 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (data.interests.isNotEmpty) ...[
                                      _RightTitle(l.interests),
                                      TemplateInterests(
                                        data: data,
                                        right: 0,
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
        ],
      ),
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
        fontFamily: AppFonts.gotham700,
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
            fontFamily: AppFonts.gotham700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          job.toUpperCase(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        maxLines: 3,
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

class _Contact extends StatelessWidget {
  const _Contact({
    required this.title,
    required this.asset,
    this.maxLines = 2,
  });

  final String title;
  final String asset;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SvgWidget(
            asset,
            height: 12,
            color: Colors.black,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              title,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontFamily: AppFonts.gotham400,
                height: 1,
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
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Text(
            education.name.toUpperCase(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontFamily: AppFonts.gotham700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            education.faculty.toUpperCase(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontFamily: AppFonts.gotham400,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '${education.startYear} - ${education.endYear}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontFamily: AppFonts.gotham400,
            ),
          ),
          const SizedBox(height: 12),
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
      padding: const EdgeInsets.only(bottom: 6),
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
