import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/data.dart';
import '../../../core/models/template.dart';
import '../../../core/widgets/button.dart';
import '../../vip/widgets/no_internet_dialog.dart';
import '../../resume/screens/create_resume_screen.dart';
import '../../resume/widgets/template_widget.dart';
import '../../vip/bloc/vip_bloc.dart';
import '../../vip/screens/vip_screen.dart';

class TemplateCard extends StatelessWidget {
  const TemplateCard({
    super.key,
    required this.template,
    required this.vip,
  });

  final Template template;
  final Vip vip;

  @override
  Widget build(BuildContext context) {
    final total = MediaQuery.sizeOf(context).width;
    final width = (total / (total > 450 ? 3 : 2)) - 31;
    final data = getMockData(template.id);
    final first = template.id == 16;

    return SizedBox(
      width: width,
      child: Button(
        onPressed: () {
          if (vip.isVip || first) {
            context.push(
              CreateResumeScreen.routePath,
              extra: template,
            );
          } else {
            if (vip.offering != null) {
              vip.hasInternet
                  ? context.push(VipScreen.routePath)
                  : NoInternetDialog.show(context);
            }
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
            if (!vip.isVip && !first)
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
