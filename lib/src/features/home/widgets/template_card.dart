import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/template.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/image_widget.dart';
import '../../resume/screens/create_resume_screen.dart';

class TemplateCard extends StatelessWidget {
  const TemplateCard({super.key, required this.template});

  final Template template;

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.sizeOf(context).width / 2) - 31;
    final height = 224.0;

    return SizedBox(
      width: width,
      child: Button(
        onPressed: () {
          context.push(CreateResumeScreen.routePath, extra: template);
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ImageWidget(
                template.asset,
                width: width,
                height: height,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
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
                      style: TextStyle(
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
