import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/template.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bg.dart';
import '../../../core/widgets/main_button.dart';
import '../bloc/resume_bloc.dart';
import '../widgets/resume_indicator.dart';
import 'information_screen.dart';

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

  void onClose() {
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
    if (stage == Stage.language) return 'Languages';
    if (stage == Stage.education) return 'Education';
    if (stage == Stage.experience) return 'Work Experience';
    if (stage == Stage.projects) return 'Projects';
    if (stage == Stage.skills) return 'Skills';
    if (stage == Stage.software) return 'Software';
    if (stage == Stage.interests) return 'Interests';
    if (stage == Stage.honors) return 'Honors';
    if (stage == Stage.about) return 'About you';
    return 'Information';
  }

  @override
  void initState() {
    super.initState();
    context.read<ResumeBloc>().add(ResetResumeStage());
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
    final information = stage == Stage.information;
    final about = stage == Stage.about;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Appbar(
        title: getTitle(stage),
        left: AppbarButton(
          asset: information ? Assets.close : Assets.left,
          onPressed: information ? onClose : onLeft,
        ),
        right: AppbarButton(
          asset: about ? Assets.close : Assets.right,
          onPressed: about ? onClose : onRight,
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
            if (information)
              InformationScreen(
                imageController: imageController,
                nameController: nameController,
                phoneController: phoneController,
                emailController: emailController,
                residenceController: residenceController,
                birthController: birthController,
                jobController: jobController,
                onImage: onImage,
              ),
          ],
        ),
      ),
    );
  }
}
