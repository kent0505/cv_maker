import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

import '../../../../core/config/constants.dart';
import '../../../../core/models/data.dart';
import '../../../../core/models/education.dart';
import '../../../../core/models/experience.dart';
import '../../../../core/models/language.dart';
import '../../../../core/utils.dart';
import '../../../../core/widgets/image_widget.dart';

// pw.Widget buildLeftSide(Data data, pw.ImageProvider? photoImage) {
//   return pw.Column(
//     crossAxisAlignment: pw.CrossAxisAlignment.start,
//     children: [
//       pw.SizedBox(height: 20),
//       pw.Container(
//         margin: const pw.EdgeInsets.symmetric(horizontal: 20),
//         height: 120,
//         width: 120,
//         decoration: pw.BoxDecoration(
//           borderRadius: pw.BorderRadius.circular(60),
//           border: pw.Border.all(
//             width: 2,
//             color: PdfColors.white,
//           ),
//         ),
//         child: photoImage != null
//             ? pw.ClipRRect(
//                 horizontalRadius: 60,
//                 verticalRadius: 60,
//                 child: pw.Image(
//                   photoImage,
//                   fit: pw.BoxFit.cover,
//                 ),
//               )
//             : pw.Container(
//                 color: PdfColors.grey300,
//               ),
//       ),
//       pw.SizedBox(height: 20),
//       ...List.generate(100, (index) => pw.Text('INDEX $index')),
//     ],
//   );
// }

// pw.Widget buildPdfContent(
//   Data data,
//   pw.ImageProvider? photoImage,
// ) {
//   return pw.Row(
//     children: [
//       pw.Expanded(
//         flex: 2,
//         child: pw.Container(
//           color: PdfColor.fromInt(0xff333333),
//           child: pw.Stack(
//             children: [
//               pw.Container(
//                 width: 1,
//                 margin: pw.EdgeInsets.only(left: 19.5),
//                 color: PdfColors.white,
//               ),
//               pw.Column(
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: [
//                   pw.SizedBox(height: 20),
//                   pw.LayoutBuilder(
//                     builder: (context, constraints) {
//                       final size = constraints!.maxWidth;

//                       return pw.Container(
//                         margin: const pw.EdgeInsets.symmetric(horizontal: 20),
//                         decoration: pw.BoxDecoration(
//                           borderRadius: pw.BorderRadius.only(
//                             topLeft: pw.Radius.circular(size / 2),
//                             topRight: pw.Radius.circular(size / 2),
//                             bottomRight: pw.Radius.circular(size / 2),
//                           ),
//                           border: pw.Border.all(
//                             width: 2,
//                             color: PdfColors.white,
//                           ),
//                         ),
//                         child: photoImage != null
//                             ? pw.Image(
//                                 photoImage,
//                                 height: size - 40,
//                                 width: size,
//                                 fit: pw.BoxFit.cover,
//                               )
//                             : pw.Container(
//                                 height: size - 40,
//                                 width: size,
//                                 color: PdfColors.grey300,
//                               ),
//                       );
//                     },
//                   ),
//                   ...List.generate(
//                     100,
//                     (index) {
//                       return pw.Text('INDEX $index');
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       pw.Expanded(
//         flex: 3,
//         child: pw.Container(),
//       ),
//     ],
//   );
// }

class Template1 extends StatelessWidget {
  const Template1({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: Color(0xff333333),
            child: Stack(
              children: [
                Container(
                  width: 1,
                  margin: EdgeInsets.only(left: 19.5),
                  color: Colors.white,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final size = constraints.maxWidth;

                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(size / 2),
                              topRight: Radius.circular(size / 2),
                              bottomRight: Radius.circular(size / 2),
                            ),
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            ),
                          ),
                          child: FileImageWidget(
                            data.resume!.photo,
                            height: size - 40,
                            width: size,
                            fit: BoxFit.cover,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(size / 2),
                              topRight: Radius.circular(size / 2),
                              bottomRight: Radius.circular(size / 2),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 12),
                    _Title('Contact me'),
                    SizedBox(height: 12),
                    _ContactMe(data.resume!.phone),
                    SizedBox(height: 6),
                    _ContactMe(data.resume!.email),
                    SizedBox(height: 6),
                    _ContactMe(data.resume!.city),
                    SizedBox(height: 20),
                    if (data.educations.isNotEmpty) ...[
                      _Title('Education'),
                      SizedBox(height: 12),
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
                      _Title('Languages'),
                      SizedBox(height: 6),
                      ...List.generate(
                        data.languages.length,
                        (index) {
                          return _LanguageData(language: data.languages[index]);
                        },
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  width: 1,
                  margin: EdgeInsets.only(left: 19.5),
                  color: Color(0xff333333),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      color: Color(0xffF0F0F0),
                      child: Row(
                        children: [
                          SizedBox(width: 15),
                          Column(
                            children: [
                              Container(
                                height: 10,
                                width: 1,
                                color: Color(0xff333333),
                              ),
                              Container(
                                height: 40,
                                width: 4,
                                margin: EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                  color: Color(0xffF3AA03),
                                  borderRadius: BorderRadius.circular(1),
                                ),
                              ),
                              Container(
                                height: 10,
                                width: 1,
                                color: Color(0xff333333),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.resume!.name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: AppFonts.inter900,
                                ),
                              ),
                              Text(
                                data.resume!.job,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontFamily: AppFonts.inter400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (data.resume!.about.isNotEmpty) ...[
                      SizedBox(height: 10),
                      _Title(
                        'About me',
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 30),
                          Expanded(
                            child: Text(
                              data.resume!.about,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 8,
                                fontFamily: AppFonts.inter400,
                                height: 1.1,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                        ],
                      ),
                    ],
                    if (data.experiences.isNotEmpty) ...[
                      SizedBox(height: 10),
                      _Title(
                        'Job Experience',
                        color: Colors.black,
                      ),
                      SizedBox(height: 6),
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
                      SizedBox(height: 10),
                      _Title(
                        'Skills',
                        color: Colors.black,
                      ),
                      SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Wrap(
                          runSpacing: 6,
                          spacing: 4,
                          children: List.generate(
                            data.skills.length,
                            (index) {
                              return _SkillData(data.skills[index].title);
                            },
                          ),
                        ),
                      ),
                    ],
                    if (data.interests.isNotEmpty) ...[
                      SizedBox(height: 10),
                      _Title(
                        'Interests',
                        color: Colors.black,
                      ),
                      SizedBox(height: 6),
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
                              return _SkillData(data.interests[index].title);
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
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(
    this.title, {
    this.color = Colors.white,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 15),
        Container(
          height: 18,
          width: 4,
          margin: EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: Color(0xffF3AA03),
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        SizedBox(width: 5),
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontFamily: AppFonts.inter900,
          ),
        ),
        SizedBox(width: 5),
      ],
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
        SizedBox(width: 16),
        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffF3AA03),
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 8,
              fontFamily: AppFonts.inter400,
              height: 1.1,
            ),
          ),
        ),
        SizedBox(width: 5),
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
        SizedBox(width: 16),
        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffF3AA03),
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                education.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontFamily: AppFonts.inter400,
                ),
              ),
              SizedBox(height: 4),
              Text(
                education.faculty,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontFamily: AppFonts.inter400,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '${education.startYear} - ${education.endYear}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontFamily: AppFonts.inter400,
                ),
              ),
              SizedBox(height: 6),
            ],
          ),
        ),
        SizedBox(width: 5),
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
        children: [
          SizedBox(width: 16),
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffF3AA03),
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              '${language.language} ${language.level}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
                fontFamily: AppFonts.inter900,
              ),
            ),
          ),
          SizedBox(width: 5),
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
            SizedBox(width: 16),
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffF3AA03),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: Text(
                experience.company,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                  fontFamily: AppFonts.inter900,
                ),
              ),
            ),
            Text(
              '${experience.startDate.split('/')[2]} - ${present ? 'Present' : experience.endDate.split('/')[2]}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 8,
                fontFamily: AppFonts.inter400,
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 30),
            Expanded(
              child: Text(
                '${experience.introduction} / ${experience.location}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 7,
                  fontFamily: AppFonts.inter700,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Row(
          children: [
            SizedBox(width: 30),
            Expanded(
              child: Text(
                experience.details,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                  fontFamily: AppFonts.inter400,
                ),
              ),
            ),
            SizedBox(width: 5),
          ],
        ),
        SizedBox(height: 10),
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
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: 0.5,
          color: Color(0xffF3AA03),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 8,
              fontFamily: AppFonts.inter400,
            ),
          ),
        ],
      ),
    );
  }
}
