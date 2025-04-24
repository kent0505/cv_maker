import 'package:flutter/material.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/models/interest.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/my_divider.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../../../core/widgets/txt_field.dart';
import '../../provider/resume_provider.dart';
import '../../widgets/field_title.dart';

class ResumeInterests extends StatelessWidget {
  const ResumeInterests({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<ResumeProvider>();

    return Column(
      children: [
        if (provider.interests.length != 8) ...[
          FieldTitle(l.enterInterest),
          const SizedBox(height: 4),
          TxtField(
            controller: provider.interestController,
            hintText: l.football,
            maxLength: 14,
            onChanged: (_) {
              provider.checkActive();
            },
          ),
        ],
        const SizedBox(height: 14),
        _InterestCard(interest: provider.interests),
        const SizedBox(height: 100),
        Text(
          l.only30Interest,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: AppFonts.funnel700,
          ),
        ),
      ],
    );
  }
}

class _InterestCard extends StatelessWidget {
  const _InterestCard({required this.interest});

  final List<Interest> interest;

  @override
  Widget build(BuildContext context) {
    return interest.isEmpty
        ? const SizedBox()
        : Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: List.generate(
                interest.length * 2 - 1,
                (index) {
                  return index.isEven
                      ? _Interest(interest: interest[index ~/ 2])
                      : const MyDivider();
                },
              ),
            ),
          );
  }
}

class _Interest extends StatelessWidget {
  const _Interest({required this.interest});

  final Interest interest;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              interest.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: AppFonts.funnel600,
              ),
            ),
          ),
          Button(
            onPressed: () {
              context.read<ResumeProvider>().removeInterest(interest);
            },
            minSize: 20,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: const Color(0xffFD9191),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Center(
                child: SvgWidget(Assets.close),
              ),
            ),
          ),
          const SizedBox(width: 14),
        ],
      ),
    );
  }
}
