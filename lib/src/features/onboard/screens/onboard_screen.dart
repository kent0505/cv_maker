import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/data.dart';
import '../../../core/models/onboard.dart';
import '../../../core/widgets/bg.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/image_widget.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/main_button.dart';
import '../../home/screens/home_screen.dart';
import '../../resume/widgets/templates/template1.dart';
import '../../resume/widgets/templates/template2.dart';
import '../../resume/widgets/templates/template3.dart';
import '../../resume/widgets/templates/template4.dart';
import '../../resume/widgets/templates/template5.dart';
import '../../resume/widgets/templates/template6.dart';
import '../../resume/widgets/templates/template7.dart';
import '../../resume/widgets/templates/template8.dart';
import '../../resume/widgets/templates/template10.dart';
import '../../resume/widgets/templates/template11.dart';
import '../../resume/widgets/templates/template12.dart';
import '../../resume/widgets/templates/template13.dart';
import '../../resume/widgets/templates/template17.dart';
import '../../resume/widgets/templates/template19.dart';
import '../../resume/widgets/templates/template20.dart';
import '../bloc/onboard_bloc.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  static const routePath = '/OnboardScreen';

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  void onContinue() {
    context.read<OnboardBloc>().add(ChangeOnboard());
  }

  void onIndicator(int value) {
    context.read<OnboardBloc>().add(ChangeOnboard(index: value));
  }

  @override
  void initState() {
    super.initState();
    context.read<OnboardBloc>().add(GetOnboard());
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final index = context.watch<OnboardBloc>().index;

    return BlocListener<OnboardBloc, OnboardState>(
      listener: (context, state) {
        if (state is OnboardDone) {
          context.go(
            HomeScreen.routePath,
            extra: true,
          );
        }
      },
      child: Scaffold(
        body: Bg(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              if (index == 1) ...[
                _Template(
                  top: -70,
                  right: 240,
                  child: Template1(data: getMockData(1)),
                ),
                _Template(
                  top: 290,
                  right: 176,
                  child: Template2(data: getMockData(2)),
                ),
                _Template(
                  top: -70,
                  right: -30,
                  child: Template17(data: getMockData(17)),
                ),
                _Template(
                  top: 290,
                  right: -94,
                  child: Template7(data: getMockData(7)),
                ),
                _Template(
                  top: 650,
                  right: 114,
                  child: Template20(data: getMockData(20)),
                ),
                _Template(
                  top: 642,
                  right: -155,
                  child: Template11(data: getMockData(11)),
                ),
                _Template(
                  top: -70,
                  right: 510,
                  child: Template4(data: getMockData(4)),
                ),
                _Template(
                  top: 290,
                  right: 446,
                  child: Template5(data: getMockData(5)),
                ),
                _Template(
                  top: 650,
                  right: 384,
                  child: Template6(data: getMockData(6)),
                ),
              ] else if (index == 2) ...[
                _Template2(
                  top: -50,
                  right: -50,
                  child: Template8(data: getMockData(8)),
                ),
                _Template2(
                  top: -100,
                  right: 218,
                  child: Template3(data: getMockData(3)),
                ),
                _Template2(
                  top: 270,
                  right: 218,
                  child: Template19(data: getMockData(19)),
                ),
                _Template2(
                  top: 316,
                  right: -50,
                  child: Template10(data: getMockData(10)),
                ),
                _Template2(
                  top: -140,
                  right: 486,
                  child: Template11(data: getMockData(11)),
                ),
                _Template2(
                  top: 230,
                  right: 486,
                  child: Template12(data: getMockData(12)),
                ),
                _Template2(
                  top: 600,
                  right: 486,
                  child: Template13(data: getMockData(13)),
                ),
                _Template2(
                  top: 640,
                  right: 218,
                  child: Template20(data: getMockData(20)),
                ),
                _Template2(
                  top: 684,
                  right: -50,
                  child: Template7(data: getMockData(7)),
                ),
              ] else if (index == 3) ...[
                Positioned(
                  top: 60,
                  right: 108,
                  child: ImageWidget(
                    Assets.onb4,
                    width: 244,
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
              ],
              Container(
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
              if (index == 2) ...[
                const Positioned(
                  top: 62,
                  right: 80,
                  child: ImageWidget(
                    Assets.onb1,
                    height: 230,
                  ),
                ),
                const Positioned(
                  top: 370,
                  right: 118,
                  child: ImageWidget(
                    Assets.onb3,
                    height: 230,
                  ),
                ),
                Positioned(
                  top: 226,
                  right: 18,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 230,
                    width: 232,
                    decoration: BoxDecoration(
                      color: const Color(0xfffbeee1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.25),
                          blurRadius: 50,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  top: 226,
                  right: 18,
                  child: ImageWidget(
                    Assets.onb2,
                    height: 230,
                    width: 232,
                  ),
                ),
              ] else if (index == 3) ...[
                Positioned(
                  top: 120,
                  right: 20,
                  child: ImageWidget(
                    Assets.onb5,
                    width: 176,
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
              ],
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
                    const Spacer(),
                    BlocBuilder<OnboardBloc, OnboardState>(
                      builder: (context, state) {
                        if (state is OnboardLoaded) {
                          final onboard = state.onboard ??
                              Onboard(
                                title1: l.onboardTitle1,
                                title2: l.onboardTitle2,
                                title3: l.onboardTitle3,
                                desc1: l.onboardDescription1,
                                desc2: l.onboardDescription2,
                                desc3: l.onboardDescription3,
                              );

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  index == 1
                                      ? onboard.title1
                                      : index == 2
                                          ? onboard.title2
                                          : onboard.title3,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontFamily: AppFonts.inter900,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  index == 1
                                      ? onboard.desc1
                                      : index == 2
                                          ? onboard.desc2
                                          : onboard.desc3,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Color(0xff9C9C9C),
                                    fontSize: 14,
                                    fontFamily: AppFonts.funnel400,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        return const Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: LoadingWidget(),
                        );
                      },
                    ),
                    const Spacer(flex: 2),
                    MainButton(
                      // title: l.continuee,
                      title: 'Continue',
                      onPressed: onContinue,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
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
          duration: const Duration(milliseconds: 500),
          height: 6,
          decoration: BoxDecoration(
            color: active ? const Color(0xff027BFF) : const Color(0xffBBDCFF),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}

class _Template extends StatelessWidget {
  const _Template({
    required this.child,
    required this.top,
    required this.right,
  });

  final double top;
  final double right;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      child: RotationTransition(
        turns: const AlwaysStoppedAnimation(-10 / 360),
        child: SizedBox(
          height: 352,
          width: 250,
          child: FittedBox(
            child: SizedBox(
              width: 550,
              height: 550 * 1.41,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Template2 extends StatelessWidget {
  const _Template2({
    required this.top,
    required this.right,
    required this.child,
  });

  final double top;
  final double right;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      child: SizedBox(
        height: 352,
        width: 250,
        child: FittedBox(
          child: SizedBox(
            width: 550,
            height: 550 * 1.41,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
