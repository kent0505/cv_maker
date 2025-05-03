import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/widgets/image_widget.dart';
import '../bloc/vip_bloc.dart';

class NoInternetDialog extends StatelessWidget {
  const NoInternetDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      useSafeArea: false,
      builder: (context) {
        return const NoInternetDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return BlocListener<VipBloc, Vip>(
      listener: (context, state) {
        if (state.hasInternet) {
          context.pop();
        }
      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  color: const Color(0xff808080).withValues(alpha: 0.55),
                ),
              ),
            ),
            Container(
              width: 270,
              decoration: BoxDecoration(
                color: const Color(0xffe7e7e7),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    l.noInternet,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: AppFonts.funnel600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const ImageWidget(
                    Assets.noWifi,
                    height: 100,
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
