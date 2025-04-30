import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/data.dart';
import '../../../core/models/resume.dart';
import '../../../core/models/template.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/button.dart';
import '../bloc/resume_bloc.dart';
import '../widgets/templates/template1.dart';
import '../widgets/templates/template2.dart';
import '../widgets/templates/template3.dart';
import '../widgets/templates/template4.dart';
import '../widgets/templates/template5.dart';
import '../widgets/templates/template6.dart';
import '../widgets/templates/template7.dart';
import '../widgets/templates/template8.dart';
import '../widgets/templates/template9.dart';
import '../widgets/templates/template10.dart';
import '../widgets/templates/template11.dart';
import '../widgets/templates/template12.dart';
import '../widgets/templates/template13.dart';
import '../widgets/templates/template14.dart';
import '../widgets/templates/template15.dart';
import '../widgets/templates/template16.dart';
import '../widgets/templates/template17.dart';
import '../widgets/templates/template18.dart';
import '../widgets/templates/template19.dart';
import '../widgets/templates/template20.dart';

class ResumeApplyScreen extends StatelessWidget {
  const ResumeApplyScreen({super.key, required this.resume});

  final Resume resume;

  static const routePath = '/ResumeApplyScreen';

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    // final t = templates.where((element) {
    //   return element.id >= 11;
    // }).toList(); // временно

    return Scaffold(
      appBar: Appbar(title: l.applyTemplates),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Wrap(
            spacing: 30,
            runSpacing: 10,
            children: List.generate(
              templates.length,
              (index) {
                return _TemplateCard(
                  template: templates[index],
                  resume: resume,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TemplateCard extends StatelessWidget {
  const _TemplateCard({
    required this.template,
    required this.resume,
  });

  final Template template;
  final Resume resume;

  @override
  Widget build(BuildContext context) {
    final total = MediaQuery.sizeOf(context).width;
    final width = (total / (total > 450 ? 3 : 2)) - 31;
    final data = getMockData(template.id);

    return SizedBox(
      width: width,
      child: Button(
        onPressed: () {
          context.read<ResumeBloc>().add(ApplyResumeTemplate(
                template: template,
                resume: resume,
              ));
          context.pop();
        },
        child: Column(
          children: [
            FittedBox(
              child: SizedBox(
                width: 550,
                height: 550 * 1.41,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: switch (template.id) {
                    1 => Template1(data: data),
                    2 => Template2(data: data),
                    3 => Template3(data: data),
                    4 => Template4(data: data),
                    5 => Template5(data: data),
                    6 => Template6(data: data),
                    7 => Template7(data: data),
                    8 => Template8(data: data),
                    9 => Template9(data: data),
                    10 => Template10(data: data),
                    11 => Template11(data: data),
                    12 => Template12(data: data),
                    13 => Template13(data: data),
                    14 => Template14(data: data),
                    15 => Template15(data: data),
                    16 => Template16(data: data),
                    17 => Template17(data: data),
                    18 => Template18(data: data),
                    19 => Template19(data: data),
                    20 => Template20(data: data),
                    _ => const SizedBox(),
                  },
                ),
              ),
            ),
            SizedBox(
              height: 44,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      template.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: AppFonts.funnel800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
