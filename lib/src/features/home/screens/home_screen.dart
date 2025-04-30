import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import '../widgets/nav_bar.dart';
import 'templates_screen.dart';
import 'resume_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routePath = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (previous, current) =>
                previous.runtimeType != current.runtimeType,
            builder: (context, state) {
              int index = state is HomeTemplates ? 0 : 1;

              return IndexedStack(
                index: index,
                children: const [
                  TemplatesScreen(),
                  ResumeScreen(),
                ],
              );
            },
          ),
          const NavBar(),
        ],
      ),
    );
  }
}
