import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/widgets/bg.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/main_button.dart';
import '../../home/screens/home_screen.dart';
import '../data/onboard_repository.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  static const routePath = '/OnboardScreen';

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int index = 1;

  void onContinue() {
    if (index == 3) {
      // context.read<OnboardRepository>().removeOnboard();
      // context.go(HomeScreen.routePath);
      setState(() {
        index = 1;
      });
    } else {
      setState(() {
        index++;
      });
    }
  }

  void onIndicator(int value) {
    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      body: Bg(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _Template(
              asset: Assets.template1,
              top: -70,
              right: 240,
            ),
            _Template(
              asset: Assets.template2,
              top: 290,
              right: 176,
            ),
            _Template(
              asset: Assets.template17,
              top: -70,
              right: -30,
            ),
            _Template(
              asset: Assets.template7,
              top: 290,
              right: -88,
            ),
            _Template(
              asset: Assets.template20,
              top: 650,
              right: 114,
            ),
            _Template(
              asset: Assets.template11,
              top: 642,
              right: -155,
            ),
            Container(
              height: MediaQuery.sizeOf(context).height / 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xff007AFF).withValues(alpha: 0),
                    const Color(0xff007AFF),
                  ],
                ),
              ),
            ),
            Container(
              height: 276,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ).copyWith(bottom: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 30),
                      _Indicator(
                        index: 1,
                        current: index,
                        onPressed: onIndicator,
                      ),
                      const SizedBox(width: 6),
                      _Indicator(
                        index: 2,
                        current: index,
                        onPressed: onIndicator,
                      ),
                      const SizedBox(width: 6),
                      _Indicator(
                        index: 3,
                        current: index,
                        onPressed: onIndicator,
                      ),
                      const SizedBox(width: 30),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Text(
                      index == 1
                          ? l.onboardTitle1
                          : index == 2
                              ? l.onboardTitle2
                              : l.onboardTitle3,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontFamily: AppFonts.inter900,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Text(
                      index == 1
                          ? l.onboardDescription1
                          : index == 2
                              ? l.onboardDescription2
                              : l.onboardDescription3,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xff9C9C9C),
                        fontSize: 14,
                        fontFamily: AppFonts.funnel400,
                      ),
                    ),
                  ),
                  const Spacer(),
                  MainButton(
                    title: l.continuee,
                    onPressed: onContinue,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({
    required this.index,
    required this.current,
    required this.onPressed,
  });

  final int index;
  final int current;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    final active = index == current;

    return Expanded(
      child: Button(
        onPressed: active
            ? null
            : () {
                onPressed(index);
              },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: 6,
          decoration: BoxDecoration(
            color: active ? Color(0xff027BFF) : Color(0xffBBDCFF),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}

class _Template extends StatelessWidget {
  const _Template({
    required this.asset,
    required this.top,
    required this.right,
  });

  final String asset;
  final double top;
  final double right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(-10 / 360),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(
            asset,
            height: 352,
          ),
        ),
      ),
    );
  }
}
