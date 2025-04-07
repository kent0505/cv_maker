import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
export 'package:provider/provider.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/language.dart';
import '../../../core/utils.dart';

class ResumeProvider extends ChangeNotifier {
  int index = 1;
  bool active = false;
  String imagePath = '';
  List<Language> languages = [];

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final birthController = TextEditingController();
  final jobController = TextEditingController();

  final languageController = TextEditingController();

  List<List<TextEditingController>> educationControllers = [
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController()
    ],
  ];

  void checkActive() {
    if (index == 2) {
      active = languageController.text.isNotEmpty;
    } else if (index == 3) {
      active = educationControllers.every(
            (element) => element.every(
              (element) => element.text.isNotEmpty,
            ),
          ) &&
          educationControllers.length != 3;
    }
    notifyListeners();
  }

  void pickImage() async {
    final file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    imagePath = file?.path ?? '';
    notifyListeners();
  }

  void setBirth(DateTime date) {
    birthController.text = dateToString(date);
    notifyListeners();
  }

  void goLeft() {
    index--;
    checkActive();
  }

  void goRight() {
    index++;
    active = false;
    checkActive();
  }

  void onSkip() {}

  void onAdd() {
    if (index == 2) {
      languages.add(
        Language(
          id: getTimestamp(),
          language: languageController.text,
          level: Levels.a1,
        ),
      );
      languageController.clear();
    }
    if (index == 3) {
      educationControllers.add([
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController()
      ]);
    }
    checkActive();
  }

  void setLanguageLevel(Language language, String level) {
    language.level = level;
    notifyListeners();
  }

  void removeLanguage(Language language) {
    languages.remove(language);
    notifyListeners();
  }

  void removeEducation(int index) {
    educationControllers.removeAt(index);
    checkActive();
  }

  void onContinue() {
    goRight();
  }

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

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    cityController.dispose();
    birthController.dispose();
    jobController.dispose();
    languageController.dispose();
    for (var controllers in educationControllers) {
      for (var controller in controllers) {
        controller.dispose();
      }
    }
    logger('DISPOSE');
    super.dispose();
  }
}
