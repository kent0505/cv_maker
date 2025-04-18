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
            builder: (context, state) {
              return state is HomeTemplates
                  ? const TemplatesScreen()
                  : const ResumeScreen();
            },
          ),
          const NavBar(),
        ],
      ),
    );
  }
}
