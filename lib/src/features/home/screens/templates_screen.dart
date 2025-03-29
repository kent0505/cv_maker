import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';
import '../../settings/screens/settings_screen.dart';

class TemplatesScreen extends StatelessWidget {
  const TemplatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color(0xff007AFF),
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 64),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Choose\na template',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: AppFonts.funnel800,
                        height: 1,
                      ),
                    ),
                  ),
                  Button(
                    onPressed: () {
                      context.push(SettingsScreen.routePath);
                    },
                    child: SvgWidget(Assets.settings),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 160),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [],
            ),
          ),
        ),
      ],
    );
  }
}
