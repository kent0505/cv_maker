import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/template.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';
import '../../settings/screens/settings_screen.dart';
import '../../vip/bloc/vip_bloc.dart';
import '../widgets/template_card.dart';

class TemplatesScreen extends StatelessWidget {
  const TemplatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final vip = context.watch<VipBloc>().state;

    return Stack(
      children: [
        Container(
          color: const Color(0xff007AFF),
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 64),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      l.chooseTemplate,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: AppFonts.funnel800,
                        height: 1,
                      ),
                    ),
                  ),
                  Button(
                    onPressed: () {
                      context.push(SettingsScreen.routePath);
                    },
                    child: const SvgWidget(Assets.settings),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 160),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            child: ListView(
              padding: const EdgeInsets.all(16).copyWith(bottom: 120),
              children: [
                Wrap(
                  spacing: 30,
                  runSpacing: 10,
                  children: List.generate(
                    templates.length,
                    (index) {
                      return TemplateCard(
                        template: templates[index],
                        vip: vip,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
