import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/interest.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/my_divider.dart';
import '../../../core/widgets/svg_widget.dart';
import '../../../core/widgets/txt_field.dart';
import '../provider/resume_provider.dart';
import '../widgets/field_title.dart';

class ResumeInterests extends StatelessWidget {
  const ResumeInterests({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<ResumeProvider>();

    return Column(
      children: [
        FieldTitle(l.enterInterest),
        const SizedBox(height: 4),
        TxtField(
          controller: provider.interestController,
          hintText: l.football,
          onChanged: (_) {
            provider.checkActive();
          },
        ),
        const SizedBox(height: 14),
        if (provider.interests.isEmpty)
          Padding(
            padding: const EdgeInsets.only(
              top: 100,
              left: 32,
              right: 32,
            ),
            child: Text(
              l.only30Interest,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: AppFonts.funnel700,
              ),
            ),
          )
        else
          _InterestCard(interest: provider.interests),
      ],
    );
  }
}

class _InterestCard extends StatelessWidget {
  const _InterestCard({required this.interest});

  final List<Interest> interest;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                : MyDivider();
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
              style: TextStyle(
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
                color: Color(0xffFD9191),
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
