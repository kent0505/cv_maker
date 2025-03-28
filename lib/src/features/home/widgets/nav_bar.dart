import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/my_colors.dart';
import '../../../core/config/constants.dart';
import '../../../core/widgets/svg_widget.dart';
import '../../../core/widgets/button.dart';
import '../bloc/home_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<MyColors>()!;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 60,
        margin: EdgeInsets.only(
          bottom: 44,
          left: 16,
          right: 16,
        ),
        padding: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: colors.blue1,
          borderRadius: BorderRadius.circular(30),
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _NavBarButton(
                  id: 1,
                  title: 'Templates',
                  asset: Assets.templates,
                  active: state is HomeTemplates,
                ),
                _NavBarButton(
                  id: 2,
                  title: 'Resume',
                  asset: Assets.resume,
                  active: state is HomeResume,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NavBarButton extends StatelessWidget {
  const _NavBarButton({
    required this.id,
    required this.title,
    required this.asset,
    required this.active,
  });

  final int id;
  final String title;
  final String asset;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<MyColors>()!;

    return Button(
      onPressed: active
          ? null
          : () {
              context.read<HomeBloc>().add(ChangeHome(id: id));
            },
      child: Container(
        height: 56,
        width: 154,
        decoration: BoxDecoration(
          color: active ? colors.white : null,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
              child: SvgWidget(
                asset,
                color: active ? colors.blue1 : colors.white,
              ),
            ),
            SizedBox(width: 5),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: active ? colors.blue1 : colors.white,
                fontSize: 14,
                fontFamily: AppFonts.funnel500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
