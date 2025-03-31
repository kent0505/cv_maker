import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/template.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bg.dart';
import '../../../core/widgets/main_button.dart';
import '../../../core/widgets/txt_field.dart';
import '../bloc/resume_bloc.dart';
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

  void onImage() async {
    final file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      imageController.text = file?.path ?? '';
    });
  }

  void onPop() {
    context.pop();
  }

  void onLeft() {
    context.read<ResumeBloc>().add(ChangeResumeStage(right: false));
  }

  void onRight() {
    context.read<ResumeBloc>().add(ChangeResumeStage(right: true));
  }

  void onContinue() {}

  String getTitle(Stage stage) {
    switch (stage) {
      case Stage.language:
        return 'Languages';
      case Stage.education:
        return 'Education';
      case Stage.experience:
        return 'Work Experience';
      case Stage.projects:
        return 'Projects';
      case Stage.skills:
        return 'Skills';
      case Stage.software:
        return 'Software';
      case Stage.interests:
        return 'Interests';
      case Stage.honors:
        return 'Honors';
      case Stage.about:
        return 'About you';
      default:
        return 'Information';
    }
  }

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
    final stage = context.watch<ResumeBloc>().stage;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Appbar(
        title: getTitle(stage),
        left: AppbarButton(
          asset: stage == Stage.information ? Assets.close : Assets.left,
          onPressed: stage == Stage.information ? onPop : onLeft,
        ),
        right: AppbarButton(
          asset: stage == Stage.about ? Assets.close : Assets.right,
          onPressed: onRight,
        ),
      ),
      body: Bg(
        topWidgets: [
          Column(
            children: [
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
            const SizedBox(height: 4),
            ResumeIndicator(stage: stage),
            const SizedBox(height: 16),
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
