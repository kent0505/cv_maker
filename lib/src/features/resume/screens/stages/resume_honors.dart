import 'package:flutter/material.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/models/honor.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/my_divider.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../../../core/widgets/txt_field.dart';
import '../../provider/resume_provider.dart';
import '../../widgets/field_title.dart';

class ResumeHonors extends StatelessWidget {
  const ResumeHonors({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<ResumeProvider>();

    return Column(
      children: [
        FieldTitle(l.enterHonor),
        const SizedBox(height: 4),
        TxtField(
          controller: provider.honorController,
          hintText: l.goldMedal,
          onChanged: (_) {
            provider.checkActive();
          },
        ),
        const SizedBox(height: 14),
        _HonorCard(honors: provider.honors),
        const SizedBox(height: 100),
        Text(
          l.only30Honor,
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

class _HonorCard extends StatelessWidget {
  const _HonorCard({required this.honors});

  final List<Honor> honors;

  @override
  Widget build(BuildContext context) {
    return honors.isEmpty
        ? const SizedBox()
        : Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: List.generate(
                honors.length * 2 - 1,
                (index) {
                  return index.isEven
                      ? _Honor(honor: honors[index ~/ 2])
                      : const MyDivider();
                },
              ),
            ),
          );
  }
}

class _Honor extends StatelessWidget {
  const _Honor({required this.honor});

  final Honor honor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              honor.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: AppFonts.funnel600,
              ),
            ),
          ),
          Button(
            onPressed: () {
              context.read<ResumeProvider>().removeHonor(honor);
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
