import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bg.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';
import '../../resume/bloc/resume_bloc.dart';
import '../../settings/screens/settings_screen.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: Appbar(
        title: l.myResume,
        left: const SizedBox(width: 30),
        right: Button(
          onPressed: () {
            context.push(SettingsScreen.routePath);
          },
          minSize: 30,
          child: const SvgWidget(
            Assets.settings,
            color: Colors.black,
          ),
        ),
      ),
      body: Bg(
        child: BlocBuilder<ResumeBloc, ResumeState>(
          builder: (context, state) {
            if (state is ResumesLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.resumes.length,
                itemBuilder: (context, index) {
                  return Text(state.resumes[index].name);
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
