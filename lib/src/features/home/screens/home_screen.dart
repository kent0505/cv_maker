import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../vip/bloc/vip_bloc.dart';
import '../../vip/screens/vip_screen.dart';
import '../../vip/screens/vip_sheet.dart';
import '../bloc/home_bloc.dart';
import '../widgets/nav_bar.dart';
import 'templates_screen.dart';
import 'resume_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onboard});

  final bool onboard;

  static const routePath = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    bool initial = true;

    return Scaffold(
      body: BlocListener<VipBloc, Vip>(
        listener: (context, state) {
          if (!state.isVip && state.hasInternet && initial) {
            initial = false;
            if (onboard) {
              context.push(VipScreen.routePath);
            } else {
              Future.delayed(Duration(seconds: 1), () {
                if (context.mounted && state.offering != null) {
                  VipSheet.show(context);
                }
              });
            }
          }
        },
        child: Stack(
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
      ),
    );
  }
}
