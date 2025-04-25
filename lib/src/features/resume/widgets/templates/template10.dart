import 'package:flutter/material.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/models/data.dart';
import '../../../../core/models/language.dart';
import '../../../../core/widgets/svg_widget.dart';
import 'widgets/template_image.dart';

class Template10 extends StatelessWidget {
  const Template10({super.key, required this.data});

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
          child: Stack(
            children: [
              const SvgWidget(
                Assets.figure1,
                height: 120,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 130),
                    _Name(name: resume.name),
                    const SizedBox(height: 20),
                    _Title(l.contactMe),
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
                    const SizedBox(height: 16),
                    if (resume.about.isNotEmpty) ...[
                      _Title(l.aboutMe),
                      _About(title: resume.about),
                      const SizedBox(height: 16),
                    ],
                    if (data.skills.isNotEmpty) ...[
                      _Title(l.skills),
                      ...List.generate(
                        data.skills.length,
                        (index) {
                          return _Data(
                            title: data.skills[index].title,
                            index: index,
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                    if (data.educations.isNotEmpty) ...[
                      _Title(l.education),
                      ...List.generate(
                        data.educations.length,
                        (index) {
                          return _Data(
                            title: data.educations[index].name,
                            index: index,
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
        Container(
          width: 220,
          color: Colors.white,
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.bottomRight,
                child: SvgWidget(
                  Assets.figure2,
                  height: 140,
                ),
              ),
              Positioned(
                bottom: 60,
                child: SizedBox(
                  width: 12,
                  height: 500,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          height: 500,
                          width: 2,
                          color: const Color(0xffF9B134),
                        ),
                      ),
                      Container(
                        height: 12,
                        width: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF9B134),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 12,
                          width: 12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffF9B134),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 12,
                          width: 12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffF9B134),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TemplateImage(data: data),
                    const SizedBox(height: 30),
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
                    if (data.interests.isNotEmpty) ...[
                      _Title(l.interests),
                      ...List.generate(
                        data.interests.length,
                        (index) {
                          return _Data(
                            title: data.interests[index].title,
                            index: index,
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
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final textSpan = TextSpan(
              text: title.toUpperCase(),
              style: const TextStyle(
                fontSize: 16,
                fontFamily: AppFonts.gotham700,
              ),
            );

            final textPainter = TextPainter(
              text: textSpan,
              maxLines: 1,
              textDirection: TextDirection.ltr,
            )..layout();

            final textWidth = textPainter.width;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: AppFonts.gotham700,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  width: textWidth,
                  height: 2,
                  color: Colors.black,
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 14),
      ],
    );
  }
}

class _Name extends StatelessWidget {
  const _Name({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name.toUpperCase(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: AppFonts.gotham900,
            fontWeight: FontWeight.w900,
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
          Container(
            height: 14,
            width: 14,
            color: const Color(0xffF9B134),
            padding: const EdgeInsets.all(2),
            child: SvgWidget(
              asset,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              title,
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
      ),
    );
  }
}

class _Data extends StatelessWidget {
  const _Data({
    required this.title,
    required this.index,
  });

  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    final isEven = index % 2 == 0;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isEven ? Color(0xffF9B134) : Colors.black,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontFamily: AppFonts.gotham700,
                height: 1,
              ),
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
    double getWidth(String level) {
      const fullWidth = 160.0;
      const levelMap = {
        Levels.a1: 1,
        Levels.a2: 2,
        Levels.b1: 3,
        Levels.b2: 4,
        Levels.c1: 5,
        Levels.c2: 6,
      };
      final index = levelMap[level] ?? 1;
      return (fullWidth / 6) * index;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            language.language,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: AppFonts.gotham400,
            ),
          ),
          const SizedBox(height: 4),
          Stack(
            children: [
              Container(
                height: 20,
                width: 160,
                decoration: BoxDecoration(
                  color: const Color(0xffE9E9E9),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Container(
                height: 20,
                width: getWidth(language.level),
                decoration: BoxDecoration(
                  color: const Color(0xffF9B134),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
        ],
      ),
    );
  }
}
