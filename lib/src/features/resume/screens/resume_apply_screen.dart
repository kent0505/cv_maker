import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/data.dart';
import '../../../core/models/resume.dart';
import '../../../core/models/template.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/button.dart';
import '../../vip/widgets/no_internet_dialog.dart';
import '../../vip/bloc/vip_bloc.dart';
import '../../vip/screens/vip_screen.dart';
import '../bloc/resume_bloc.dart';
import '../widgets/template_widget.dart';

class ResumeApplyScreen extends StatelessWidget {
  const ResumeApplyScreen({super.key, required this.resume});

  final Resume resume;

  static const routePath = '/ResumeApplyScreen';

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

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
    final state = context.watch<VipBloc>().state;
    final first = template.id == 16;

    return SizedBox(
      width: width,
      child: Button(
        onPressed: () {
          if (state.isVip || first) {
            context.read<ResumeBloc>().add(ApplyResumeTemplate(
                  template: template,
                  resume: resume,
                ));
            context.pop();
          } else {
            state.hasInternet
                ? context.push(VipScreen.routePath)
                : NoInternetDialog.show(context);
          }
        },
        child: Stack(
          children: [
            Column(
              children: [
                FittedBox(
                  child: SizedBox(
                    width: 550,
                    height: 550 * 1.41,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: TemplateWidget(
                        data: data,
                        id: template.id,
                      ),
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
            if (!state.isVip && !first)
              Positioned(
                top: 20,
                right: 20,
                child: const Icon(
                  Icons.lock,
                  color: Color(0xff606060),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
