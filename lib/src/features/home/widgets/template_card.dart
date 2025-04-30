import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/data.dart';
import '../../../core/models/template.dart';
import '../../../core/widgets/button.dart';
import '../../resume/screens/create_resume_screen.dart';
import '../../resume/widgets/template_widget.dart';

class TemplateCard extends StatelessWidget {
  const TemplateCard({super.key, required this.template});

  final Template template;

  @override
  Widget build(BuildContext context) {
    final total = MediaQuery.sizeOf(context).width;
    final width = (total / (total > 450 ? 3 : 2)) - 31;
    final data = getMockData(template.id);

    return SizedBox(
      width: width,
      child: Button(
        onPressed: () {
          context.push(
            CreateResumeScreen.routePath,
            extra: template,
          );
        },
        child: Column(
          children: [
            FittedBox(
              child: SizedBox(
                width: 550,
                height: 550 * 1.41,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: TemplateWidget(data: data),
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
