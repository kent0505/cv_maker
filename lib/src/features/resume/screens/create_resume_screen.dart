import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/template.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bg.dart';
import '../../../core/widgets/main_button.dart';
import '../../../core/widgets/txt_field.dart';
import '../widgets/field_title.dart';
import '../widgets/resume_indicator.dart';
import '../widgets/user_image.dart';

class CreateResumeScreen extends StatefulWidget {
  const CreateResumeScreen({super.key, required this.template});

  final Template template;

  static const routePath = '/CreateResumeScreen';

  @override
  State<CreateResumeScreen> createState() => _CreateResumeScreenState();
}

class _CreateResumeScreenState extends State<CreateResumeScreen> {
  final imageController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final residenceController = TextEditingController();
  final birthController = TextEditingController();
  final jobController = TextEditingController();

  void onImage(String path) {
    setState(() {
      imageController.text = path;
    });
  }

  void onLeft() {
    context.pop();
  }

  void onRight() {}

  void onContinue() {}

  @override
  void dispose() {
    imageController.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    residenceController.dispose();
    birthController.dispose();
    jobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Appbar(
        title: 'Information',
        left: AppbarButton(
          asset: Assets.close,
          onPressed: onLeft,
        ),
        right: AppbarButton(
          asset: Assets.right,
          onPressed: onRight,
        ),
      ),
      body: Bg(
        topWidgets: [
          Column(
            children: [
              const SizedBox(height: 20),
              const ResumeIndicator(),
              const Spacer(),
              MainButton(
                title: l.continuee,
                onPressed: onContinue,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
        child: ListView(
          padding: EdgeInsets.all(16).copyWith(bottom: 100),
          children: [
            const SizedBox(height: 24),
            UserImage(
              controller: imageController,
              onPressed: onImage,
            ),
            const SizedBox(height: 8),
            FieldTitle('Name'),
            const SizedBox(height: 4),
            TxtField(
              controller: nameController,
              hintText: 'Alex',
            ),
            const SizedBox(height: 16),
            FieldTitle('Mobile phone'),
            const SizedBox(height: 4),
            TxtField(
              controller: phoneController,
              number: true,
              hintText: '(239) 555 - 0108',
            ),
            const SizedBox(height: 16),
            FieldTitle('Email'),
            const SizedBox(height: 4),
            TxtField(
              controller: emailController,
              hintText: 'yourmail@example.com',
            ),
            const SizedBox(height: 16),
            FieldTitle('City of Residence'),
            const SizedBox(height: 4),
            TxtField(
              controller: residenceController,
              hintText: 'Pembroke Pines',
            ),
            const SizedBox(height: 16),
            FieldTitle('Date of birth'),
            const SizedBox(height: 4),
            TxtField(
              controller: birthController,
              hintText: '3/16/25',
            ),
            const SizedBox(height: 16),
            FieldTitle('Job Title'),
            const SizedBox(height: 4),
            TxtField(
              controller: jobController,
              hintText: 'Manager',
            ),
          ],
        ),
      ),
    );
  }
}
