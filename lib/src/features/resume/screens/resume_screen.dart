import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bg.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';
import '../../settings/screens/settings_screen.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: 'My Resume',
        left: const SizedBox(width: 30),
        right: Button(
          onPressed: () {
            context.push(SettingsScreen.routePath);
          },
          minSize: 30,
          child: SvgWidget(
            Assets.settings,
            color: Colors.black,
          ),
        ),
      ),
      body: Bg(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [],
        ),
      ),
    );
  }
}
