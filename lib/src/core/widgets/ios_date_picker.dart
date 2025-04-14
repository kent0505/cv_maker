import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/constants.dart';
import 'button.dart';
import 'main_button.dart';
import 'svg_widget.dart';

class IosDatePicker extends StatefulWidget {
  const IosDatePicker({
    super.key,
    this.birthDay = false,
    required this.initialDateTime,
    required this.onDone,
  });

  final bool birthDay;
  final DateTime initialDateTime;
  final void Function(DateTime) onDone;

  static void show(
    BuildContext context,
    DateTime initialDateTime,
    void Function(DateTime) onDone, {
    bool birthDay = false,
  }) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return IosDatePicker(
          birthDay: birthDay,
          initialDateTime: initialDateTime,
          onDone: onDone,
        );
      },
    );
  }

  @override
  State<IosDatePicker> createState() => _IosDatePickerState();
}

class _IosDatePickerState extends State<IosDatePicker> {
  DateTime date = DateTime.now();

  void onDateTimeChanged(DateTime value) {
    date = value;
  }

  void onDone() {
    widget.onDone(date);
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    date = widget.initialDateTime;
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final width = 344.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 148),
          SizedBox(
            width: width,
            height: width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Container(
                      color: Color(0xff808080).withValues(alpha: 0.55),
                    ),
                  ),
                ),
                Container(
                  height: 214,
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: CupertinoTheme(
                    data: const CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                        dateTimePickerTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: AppFonts.funnel400,
                        ),
                      ),
                    ),
                    child: CupertinoDatePicker(
                      onDateTimeChanged: onDateTimeChanged,
                      initialDateTime: widget.initialDateTime,
                      mode: CupertinoDatePickerMode.date,
                      use24hFormat: true,
                      minimumYear: 1950,
                      maximumYear: DateTime.now().year + 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          widget.birthDay
              ? MainButton(
                  title: l.continuee,
                  onPressed: onDone,
                )
              : SizedBox(
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Button(
                        onPressed: onDone,
                        child: Container(
                          height: 48,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Next',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: AppFonts.funnel700,
                                ),
                              ),
                              SizedBox(width: 12),
                              SvgWidget(Assets.arrow),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
