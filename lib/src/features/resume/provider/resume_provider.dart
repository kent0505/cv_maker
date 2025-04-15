import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
export 'package:provider/provider.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/data.dart';
import '../../../core/models/education.dart';
import '../../../core/models/experience.dart';
import '../../../core/models/honor.dart';
import '../../../core/models/interest.dart';
import '../../../core/models/language.dart';
import '../../../core/models/project.dart';
import '../../../core/models/skill.dart';
import '../../../core/utils.dart';

class ResumeProvider extends ChangeNotifier {
  int _id = getTimestamp();
  int _index = 1;
  bool _canAdd = false;
  bool _canContinue = false;
  String _imagePath = '';

  List<Language> _languages = [];
  List<Skill> _skills = [];
  List<Interest> _interests = [];
  List<Honor> _honors = [];

  // GETTERS
  int get id => _id;
  int get index => _index;
  bool get canAdd => _canAdd;
  bool get canContinue => _canContinue;
  String get imagePath => _imagePath;

  List<Language> get languages => _languages;
  List<Skill> get skills => _skills;
  List<Interest> get interests => _interests;
  List<Honor> get honors => _honors;

  // КОНТРОЛЛЕРЫ
  final nameController = TextEditingController(text: 'Otabek Yusupov');
  final phoneController = TextEditingController(text: '+998 99 847 25 80');
  final emailController =
      TextEditingController(text: 'otabekyusupov0550@gmail.com');
  final cityController = TextEditingController(text: 'Tashkent');
  final birthController = TextEditingController(text: '22/06/2000');
  final jobController = TextEditingController(text: 'Flutter developer');
  final languageController = TextEditingController();
  final skillController = TextEditingController();
  final interestController = TextEditingController();
  final honorController = TextEditingController();
  final aboutController = TextEditingController();

  List<List<TextEditingController>> educationControllers = [
    List.generate(5, (_) => TextEditingController()),
  ];
  List<List<TextEditingController>> experienceControllers = [
    List.generate(6, (_) => TextEditingController()),
  ];
  List<List<TextEditingController>> projectControllers = [
    List.generate(4, (_) => TextEditingController()),
  ];

  ResumeProvider(Data data) {
    logger('INIT');
    if (data.resume != null) {
      final resume = data.resume!;
      _id = resume.id;
      _imagePath = resume.photo;
      nameController.text = resume.name;
      phoneController.text = resume.phone;
      emailController.text = resume.email;
      cityController.text = resume.city;
      birthController.text = resume.birth;
      jobController.text = resume.job;
      aboutController.text = resume.about;
      _languages = data.languages;
      _skills = data.skills;
      _interests = data.interests;
      _honors = data.honors;
      if (data.educations.isNotEmpty) {
        educationControllers = data.educations.map((edu) {
          return [
            TextEditingController(text: edu.name),
            TextEditingController(text: edu.faculty),
            TextEditingController(text: edu.specialization),
            TextEditingController(text: edu.startYear),
            TextEditingController(text: edu.endYear),
          ];
        }).toList();
      }
      if (data.experiences.isNotEmpty) {
        experienceControllers = data.experiences.map((work) {
          return [
            TextEditingController(text: work.company),
            TextEditingController(text: work.location),
            TextEditingController(text: work.introduction),
            TextEditingController(text: work.details),
            TextEditingController(text: work.startDate),
            TextEditingController(text: work.endDate),
          ];
        }).toList();
      }
      if (data.projects.isNotEmpty) {
        projectControllers = data.projects.map((project) {
          return [
            TextEditingController(text: project.name),
            TextEditingController(text: project.startDate),
            TextEditingController(text: project.endDate),
            TextEditingController(text: project.details),
          ];
        }).toList();
      }

      checkActive();
    }
  }

  List<Education> getEducations() {
    return educationControllers
        .where(
            (controllers) => controllers.any((c) => c.text.trim().isNotEmpty))
        .map((controllers) {
      return Education(
        id: _id,
        name: controllers[0].text,
        faculty: controllers[1].text,
        specialization: controllers[2].text,
        startYear: controllers[3].text,
        endYear: controllers[4].text,
      );
    }).toList();
  }

  List<Experience> getExperiences() {
    return experienceControllers
        .where(
            (controllers) => controllers.any((c) => c.text.trim().isNotEmpty))
        .map((controllers) {
      return Experience(
        id: _id,
        company: controllers[0].text,
        location: controllers[1].text,
        introduction: controllers[2].text,
        details: controllers[3].text,
        startDate: controllers[4].text,
        endDate: controllers[5].text,
      );
    }).toList();
  }

  List<Project> getProjects() {
    return projectControllers
        .where(
            (controllers) => controllers.any((c) => c.text.trim().isNotEmpty))
        .map((controllers) {
      return Project(
        id: _id,
        name: controllers[0].text,
        details: controllers[1].text,
        startDate: controllers[2].text,
        endDate: controllers[3].text,
      );
    }).toList();
  }

  // РЕГУЛИРОВКА АКТИВНОСТИ КНОПКИ
  void checkActive() {
    logger(_index);

    switch (_index) {
      case 1:
        _canContinue = [
          _imagePath,
          nameController.text,
          phoneController.text,
          emailController.text,
          cityController.text,
          birthController.text,
          jobController.text,
        ].every((e) => e.isNotEmpty);
        break;
      case 2:
        _canAdd = languageController.text.isNotEmpty;
        _canContinue = _languages.isNotEmpty;
        break;
      case 3:
        final active = educationControllers
                .every((e) => e.every((t) => t.text.isNotEmpty)) &&
            educationControllers.length != 3;
        _canAdd = _canContinue = active;
        break;
      case 4:
        final active = experienceControllers
                .every((e) => e.every((t) => t.text.isNotEmpty)) &&
            experienceControllers.length != 5;
        _canAdd = _canContinue = active;
        break;
      case 5:
        final active = projectControllers
                .every((e) => e.every((t) => t.text.isNotEmpty)) &&
            projectControllers.length != 5;
        _canAdd = _canContinue = active;
        break;
      case 6:
        _canAdd = skillController.text.isNotEmpty && _skills.length < 30;
        _canContinue = true;
        break;
      case 7:
        _canAdd = interestController.text.isNotEmpty && _interests.length < 30;
        _canContinue = true;
        break;
      case 8:
        _canAdd = honorController.text.isNotEmpty && _honors.length < 30;
        _canContinue = true;
        break;
      case 9:
        _canContinue = aboutController.text.isNotEmpty;
        break;
    }

    notifyListeners();
  }

  // ВЫБРАТЬ АВАТАРКУ
  void pickImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    _imagePath = file?.path ?? '';
    checkActive();
  }

  // УСТАНОВКА ДАТЫ ЧЕРЕЗ DATE PICKER
  void setDate(TextEditingController controller, DateTime date) {
    controller.text = dateToString(date);
    checkActive();
  }

  // ПЕРЕХОДЫ МЕЖДУ СТРАНИЦАМИ
  void goLeft() {
    _index--;
    checkActive();
  }

  void goRight() {
    if (canContinue) {
      _index++;
      checkActive();
    }
  }

  void onSkip() {
    _index++;
    checkActive();
  }

  // ДОБАВЛЕНИЕ ДОПОЛНИТЕЛЬНЫХ ПОЛЕЙ
  void onAdd() {
    switch (_index) {
      case 2:
        _languages.add(
          Language(
            id: _id,
            language: languageController.text,
            level: Levels.a1,
          ),
        );
        languageController.clear();
        logger('LANGUAGES ${_languages.length}');
        break;
      case 3:
        educationControllers.add(
          List.generate(5, (_) => TextEditingController()),
        );
        break;
      case 4:
        experienceControllers.add(
          List.generate(6, (_) => TextEditingController()),
        );
        break;
      case 5:
        projectControllers.add(
          List.generate(4, (_) => TextEditingController()),
        );
        break;
      case 6:
        _skills.add(
          Skill(
            id: _id,
            title: skillController.text,
          ),
        );
        skillController.clear();
        break;
      case 7:
        _interests.add(
          Interest(
            id: _id,
            title: interestController.text,
          ),
        );
        interestController.clear();
        break;
      case 8:
        _honors.add(
          Honor(
            id: _id,
            title: honorController.text,
          ),
        );
        honorController.clear();
        break;
    }

    checkActive();
  }

  // ВЫБОР УРОВНЯ ЯЗЫКА
  void setLanguageLevel(Language language, String level) {
    language.level = level;
    notifyListeners();
  }

  // УБРАТЬ КАРТОЧКИ
  void removeLanguage(Language language) {
    _languages.remove(language);
    checkActive();
  }

  void removeSkill(Skill skill) {
    _skills.remove(skill);
    notifyListeners();
  }

  void removeInterest(Interest interest) {
    _interests.remove(interest);
    notifyListeners();
  }

  void removeHonor(Honor honor) {
    _honors.remove(honor);
    notifyListeners();
  }

  // УБРАТЬ ПОЛЯ
  void removeEducation(int i) {
    educationControllers.removeAt(i);
    checkActive();
  }

  void removeExperience(int i) {
    experienceControllers.removeAt(i);
    checkActive();
  }

  void removeProject(int i) {
    projectControllers.removeAt(i);
    checkActive();
  }

  // ПОЛУЧИТЬ ЛОКАЛИЗОВННЫЙ ТЕКСТ АППБАРА
  String getTitle(AppLocalizations l) {
    if (_index == 2) return l.languages;
    if (_index == 3) return l.education;
    if (_index == 4) return l.workExperience;
    if (_index == 5) return l.projects;
    if (_index == 6) return l.skills;
    if (_index == 7) return l.interests;
    if (_index == 8) return l.honors;
    if (_index == 9) return l.aboutYou;
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
    skillController.dispose();
    interestController.dispose();
    honorController.dispose();
    aboutController.dispose();

    for (final list in [
      educationControllers,
      experienceControllers,
      projectControllers,
    ]) {
      for (var controllers in list) {
        for (var controller in controllers) {
          controller.dispose();
        }
      }
    }

    logger('DISPOSE');
    super.dispose();
  }
}
