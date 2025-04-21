import 'package:flutter/material.dart';

import '../../../../../core/config/constants.dart';
import '../../../../../core/models/data.dart';
import '../../../../../core/utils.dart';

class TemplateSkills extends StatelessWidget {
  const TemplateSkills({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final skills = data.skills;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (skills.isNotEmpty) ...[
          Row(
            children: [
              const SizedBox(width: 22.5),
              Container(
                height: 22,
                width: 4,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  color: const Color(0xffF3AA03),
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                l.skills,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getTitleFontSize(data.resume!.template),
                  fontFamily: AppFonts.gotham900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(
              left: 37.5,
              right: 5,
            ),
            child: Wrap(
              runSpacing: 6,
              spacing: 4,
              children: List.generate(
                skills.length,
                (index) {
                  return _Card(skills[index].title);
                },
              ),
            ),
          ),
          const SizedBox(height: 6),
        ],
      ],
    );
  }
}

class _Card extends StatelessWidget {
  const _Card(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: 0.5,
          color: const Color(0xffF3AA03),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 6,
              fontFamily: AppFonts.gotham400,
            ),
          ),
        ],
      ),
    );
  }
}
