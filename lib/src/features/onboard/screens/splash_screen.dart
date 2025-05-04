import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/loading_widget.dart';
import '../../home/screens/home_screen.dart';
import '../../vip/bloc/vip_bloc.dart';
import '../bloc/onboard_bloc.dart';
import '../data/onboard_repository.dart';
import 'onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OnboardBloc>().add(GetOnboard());
    context.read<VipBloc>().add(CheckVip());
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          if (context.read<OnboardRepository>().isOnBoard()) {
            context.go(OnboardScreen.routePath);
          } else {
            context.go(HomeScreen.routePath);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoadingWidget(),
    );
  }
}
