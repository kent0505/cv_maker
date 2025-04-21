import 'package:flutter/material.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/models/data.dart';
import '../../../../core/models/education.dart';
import '../../../../core/models/experience.dart';
import '../../../../core/models/language.dart';
import '../../../../core/utils.dart';
import '../../../../core/widgets/image_widget.dart';

class Template2 extends StatelessWidget {
  const Template2({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final imageSize = 160.0;

    return Row(
      children: [
        Container(
          width: 220,
          color: const Color(0xffF3AA03),
          child: Stack(
            children: [
              Container(
                width: 1,
                margin: const EdgeInsets.only(left: 19.5),
                color: Colors.white,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(imageSize / 2),
                        topRight: Radius.circular(imageSize / 2),
                        bottomRight: Radius.circular(imageSize / 2),
                      ),
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                    ),
                    child: FileImageWidget(
                      data.resume!.photo,
                      height: imageSize,
                      width: imageSize,
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(imageSize / 2),
                        topRight: Radius.circular(imageSize / 2),
                        bottomRight: Radius.circular(imageSize / 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const SizedBox(width: 15),
                      Container(
                        height: 40,
                        width: 4,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.resume!.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: AppFonts.gotham900,
                                height: 1,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              data.resume!.job.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: AppFonts.gotham400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                  const SizedBox(height: 6),
                  _Title(l.contactMe),
                  const SizedBox(height: 12),
                  _ContactMe(data.resume!.phone),
                  const SizedBox(height: 6),
                  _ContactMe(data.resume!.email),
                  const SizedBox(height: 6),
                  _ContactMe(data.resume!.city),
                  if (data.educations.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    _Title(l.education),
                    const SizedBox(height: 6),
                    ...List.generate(
                      data.educations.length,
                      (index) {
                        return _EducationData(
                          education: data.educations[index],
                        );
                      },
                    ),
                  ],
                  if (data.languages.isNotEmpty) ...[
                    _Title(l.languages),
                    const SizedBox(height: 6),
                    ...List.generate(
                      data.languages.length,
                      (index) {
                        return _LanguageData(
                          language: data.languages[index],
                        );
                      },
                    ),
                  ],
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
                margin: const EdgeInsets.only(left: 19.5),
                color: const Color(0xff333333),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  if (data.resume!.about.isNotEmpty) ...[
                    _Title(
                      l.aboutMe,
                      right: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 5,
                      ),
                      child: SizedBox(
                        height: 90,
                        child: Text(
                          data.resume!.about,
                          maxLines: 8,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: AppFonts.gotham400,
                            height: 1.1,
                          ),
                        ),
                      ),
                    ),
                  ],
                  if (data.experiences.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    _Title(
                      l.jobExperience,
                      right: true,
                    ),
                    const SizedBox(height: 6),
                    ...List.generate(
                      data.experiences.length,
                      (index) {
                        return _ExperienceData(
                          experience: data.experiences[index],
                        );
                      },
                    ),
                  ],
                  if (data.skills.isNotEmpty) ...[
                    _Title(
                      l.skills,
                      right: true,
                    ),
                    const SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Wrap(
                        runSpacing: 6,
                        spacing: 4,
                        children: List.generate(
                          data.skills.length,
                          (index) {
                            return _SkillData(
                              data.skills[index].title,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                  if (data.interests.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    _Title(
                      l.interests,
                      right: true,
                    ),
                    const SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 5,
                      ),
                      child: Wrap(
                        runSpacing: 6,
                        spacing: 4,
                        children: List.generate(
                          data.interests.length,
                          (index) {
                            return _SkillData(
                              data.interests[index].title,
                            );
                          },
                        ),
                      ),
                    ),
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

class _Title extends StatelessWidget {
  const _Title(
    this.title, {
    this.right = false,
  });

  final String title;
  final bool right;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15),
        Container(
          height: 22,
          width: 4,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: right ? Color(0xffF3AA03) : Colors.white,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: right ? Colors.black : Colors.white,
              fontSize: right ? 24 : 16,
              fontFamily: AppFonts.gotham900,
            ),
          ),
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}

class _Circle extends StatelessWidget {
  const _Circle({this.right = false});

  final bool right;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: right ? Color(0xffF3AA03) : Colors.white,
      ),
    );
  }
}

class _ContactMe extends StatelessWidget {
  const _ContactMe(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 16),
        _Circle(),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontFamily: AppFonts.gotham400,
              height: 1.1,
            ),
          ),
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}

class _EducationData extends StatelessWidget {
  const _EducationData({required this.education});

  final Education education;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 16),
        const _Circle(),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                education.name.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontFamily: AppFonts.gotham900,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                education.faculty.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontFamily: AppFonts.gotham400,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${education.startYear} - ${education.endYear}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontFamily: AppFonts.gotham400,
                ),
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}

class _LanguageData extends StatelessWidget {
  const _LanguageData({required this.language});

  final Language language;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 16),
          const _Circle(),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              '${language.language} (${language.level})',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontFamily: AppFonts.gotham900,
                height: 1,
              ),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}

class _ExperienceData extends StatelessWidget {
  const _ExperienceData({required this.experience});

  final Experience experience;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final endDate = stringToDate(experience.endDate);
    final present = now.day <= endDate.day &&
        now.month <= endDate.month &&
        now.year <= endDate.year;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 16),
            const _Circle(right: true),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                experience.company.toUpperCase(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                  fontFamily: AppFonts.gotham900,
                ),
              ),
            ),
            Text(
              '${experience.startDate.split('/')[2]} - ${present ? 'Present' : experience.endDate.split('/')[2]}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 8,
                fontFamily: AppFonts.gotham400,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            const SizedBox(width: 30),
            Expanded(
              child: Text(
                '${experience.introduction} / ${experience.location}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 7,
                  fontFamily: AppFonts.gotham700,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const SizedBox(width: 30),
            Expanded(
              child: Text(
                experience.details,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                  fontFamily: AppFonts.gotham400,
                ),
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _SkillData extends StatelessWidget {
  const _SkillData(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: 0.5,
          color: const Color(0xffF3AA03),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 6,
              fontFamily: AppFonts.gotham400,
            ),
          ),
        ],
      ),
    );
  }
}
