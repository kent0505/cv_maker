import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/template.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bg.dart';
import '../widgets/resume_indicator.dart';
import 'resume_education.dart';
import 'resume_experience.dart';
import 'resume_information.dart';
import 'resume_languages.dart';

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

  final languageController = TextEditingController();

  final universityControllers = [TextEditingController()];
  final facultyControllers = [TextEditingController()];
  final specializationControllers = [TextEditingController()];
  final startYearControllers = [TextEditingController()];
  final endYearControllers = [TextEditingController()];

  final workCompanyControllers = [TextEditingController()];
  final workLocationControllers = [TextEditingController()];
  final workIntroductionControllers = [TextEditingController()];
  final workDetailsControllers = [TextEditingController()];
  final workStartDateControllers = [TextEditingController()];
  final workEndDateControllers = [TextEditingController()];

  int index = 1;

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
    setState(() {
      index--;
    });
  }

  void onRight() {
    setState(() {
      index++;
    });
  }

  void onContinue() {}

  String getTitle(AppLocalizations l) {
    if (index == 2) return l.languages;
    if (index == 3) return l.education;
    if (index == 4) return l.workExperience;
    if (index == 5) return l.projects;
    if (index == 6) return l.skills;
    if (index == 7) return l.software;
    if (index == 8) return l.interests;
    if (index == 9) return l.honors;
    if (index == 10) return l.aboutYou;
    return l.information;
  }

  void disposeControllers(List<TextEditingController> controllers) {
    for (var controller in controllers) {
      controller.dispose();
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
    languageController.dispose();
    disposeControllers(universityControllers);
    disposeControllers(facultyControllers);
    disposeControllers(specializationControllers);
    disposeControllers(startYearControllers);
    disposeControllers(endYearControllers);
    disposeControllers(workCompanyControllers);
    disposeControllers(workLocationControllers);
    disposeControllers(workIntroductionControllers);
    disposeControllers(workDetailsControllers);
    disposeControllers(workStartDateControllers);
    disposeControllers(workEndDateControllers);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Appbar(
        title: getTitle(l),
        left: AppbarButton(
          asset: index == 1 ? Assets.close : Assets.left,
          onPressed: index == 1 ? onClose : onLeft,
        ),
        right: AppbarButton(
          asset: index == 10 ? Assets.close : Assets.right,
          onPressed: index == 10 ? onClose : onRight,
        ),
      ),
      body: Bg(
        child: ListView(
          padding: EdgeInsets.all(16).copyWith(bottom: 100),
          children: [
            const SizedBox(height: 4),
            ResumeIndicator(index: index),
            const SizedBox(height: 16),
            if (index == 1)
              ResumeInformation(
                controllers: [
                  imageController,
                  nameController,
                  phoneController,
                  emailController,
                  residenceController,
                  birthController,
                  jobController,
                ],
                onImage: onImage,
              )
            else if (index == 2)
              ResumeLanguages(
                languageController: languageController,
              )
            else if (index == 3)
              ...List.generate(
                universityControllers.length,
                (index) {
                  return ResumeEducation(
                    controllers: [
                      universityControllers[index],
                      facultyControllers[index],
                      specializationControllers[index],
                      startYearControllers[index],
                      endYearControllers[index],
                    ],
                  );
                },
              )
            else if (index == 4)
              ...List.generate(
                universityControllers.length,
                (index) {
                  return ResumeWork(
                    controllers: [
                      workCompanyControllers[index],
                      workLocationControllers[index],
                      workIntroductionControllers[index],
                      workDetailsControllers[index],
                      workStartDateControllers[index],
                      workEndDateControllers[index],
                    ],
                  );
                },
              )
          ],
        ),
      ),
    );
  }
}
