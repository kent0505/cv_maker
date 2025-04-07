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

  // КОНТРОЛЛЕРЫ
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final birthController = TextEditingController();
  final jobController = TextEditingController();
  final languageController = TextEditingController();
  List<List<TextEditingController>> educationControllers = [
    List.generate(5, (_) {
      return TextEditingController();
    }),
  ];
  List<List<TextEditingController>> experienceControllers = [
    List.generate(6, (_) {
      return TextEditingController();
    }),
  ];
  List<List<TextEditingController>> projectControllers = [
    List.generate(4, (_) {
      return TextEditingController();
    }),
  ];

  // РЕГУЛИРОВКА АКТИВНОСТИ КНОПКИ
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
    } else if (index == 4) {
      active = experienceControllers.every(
            (element) => element.every(
              (element) => element.text.isNotEmpty,
            ),
          ) &&
          experienceControllers.length != 5;
    } else if (index == 5) {
      active = projectControllers.every(
            (element) => element.every(
              (element) => element.text.isNotEmpty,
            ),
          ) &&
          projectControllers.length != 5;
    }
    notifyListeners();
  }

  // ВЫБРАТЬ АВАТАРКУ
  void pickImage() async {
    final file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    imagePath = file?.path ?? '';
    notifyListeners();
  }

  // УСТАНОВКА ДАТЫ ЧЕРЕЗ DATE PICKER
  void setDate(TextEditingController controller, DateTime date) {
    controller.text = dateToString(date);
    checkActive();
  }

  // ПЕРЕХОДЫ МЕЖДУ СТРАНИЦАМИ
  void goLeft() {
    index--;
    checkActive();
  }

  void goRight() {
    index++;
    active = false;
    checkActive();
  }

  void onContinue() {
    goRight();
  }

  // ДОБАВЛЕНИЕ ДОПОЛНИТЕЛЬНЫХ ПОЛЕЙ
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
    } else if (index == 3) {
      educationControllers.add(
        List.generate(5, (_) {
          return TextEditingController();
        }),
      );
    } else if (index == 4) {
      experienceControllers.add(
        List.generate(6, (_) {
          return TextEditingController();
        }),
      );
    } else if (index == 5) {
      projectControllers.add(
        List.generate(4, (_) {
          return TextEditingController();
        }),
      );
    }
    checkActive();
  }

  // ВЫБОР УРОВНЯ ЯЗЫКА
  void setLanguageLevel(Language language, String level) {
    language.level = level;
    notifyListeners();
  }

  // УБРАТЬ ЯЗЫК
  void removeLanguage(Language language) {
    languages.remove(language);
    notifyListeners();
  }

  // УБРАТЬ ПОЛЯ
  void removeEducation(int index) {
    educationControllers.removeAt(index);
    checkActive();
  }

  void removeExperience(int index) {
    experienceControllers.removeAt(index);
    checkActive();
  }

  void removeProject(int index) {
    projectControllers.removeAt(index);
    checkActive();
  }

  // ПОЛУЧИТЬ ЛОКАЛИЗОВННЫЙ ТЕКСТ АППБАРА
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

  // УНИЧТОЖИТЬ КОНТРОЛЛЕРЫ
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
    for (var controllers in experienceControllers) {
      for (var controller in controllers) {
        controller.dispose();
      }
    }
    for (var controllers in projectControllers) {
      for (var controller in controllers) {
        controller.dispose();
      }
    }
    logger('DISPOSE');
    super.dispose();
  }
}
