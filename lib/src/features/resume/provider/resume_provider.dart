import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
export 'package:provider/provider.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/data.dart';
import '../../../core/models/education.dart';
import '../../../core/models/experience.dart';
import '../../../core/models/interest.dart';
import '../../../core/models/language.dart';
import '../../../core/models/skill.dart';
import '../../../core/utils.dart';

class ResumeProvider extends ChangeNotifier {
  int _id = getTimestamp();
  int _index = 1;
  bool _canAdd = false;
  bool _canContinue = false;
  bool _canPop = true;
  String _imagePath = '';

  List<Language> _languages = [];
  List<Skill> _skills = [];
  List<Interest> _interests = [];

  // GETTERS
  int get id => _id;
  int get index => _index;
  bool get canAdd => _canAdd;
  bool get canContinue => _canContinue;
  bool get canPop => _canPop;
  String get imagePath => _imagePath;

  List<Language> get languages => _languages;
  List<Skill> get skills => _skills;
  List<Interest> get interests => _interests;

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
  final aboutController = TextEditingController();

  List<List<TextEditingController>> educationControllers = [
    List.generate(5, (_) => TextEditingController()),
  ];
  List<List<TextEditingController>> experienceControllers = [
    List.generate(6, (_) => TextEditingController()),
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

      checkActive(init: true);
    }
  }

  List<Education> getEducations() {
    return educationControllers
        .where(
            (controllers) => controllers.every((c) => c.text.trim().isNotEmpty))
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
            (controllers) => controllers.every((c) => c.text.trim().isNotEmpty))
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

  // РЕГУЛИРОВКА АКТИВНОСТИ КНОПКИ
  void checkActive({bool init = false}) {
    logger(_index);
    if (!init) _canPop = false;
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
        final allFilled = educationControllers
            .every((e) => e.every((t) => t.text.isNotEmpty));
        _canAdd = allFilled;
        _canContinue = allFilled;
        break;
      case 4:
        final allFilled = experienceControllers
            .every((e) => e.every((t) => t.text.isNotEmpty));
        _canAdd = allFilled;
        _canContinue = allFilled;
        break;
      case 5:
        _canAdd = skillController.text.isNotEmpty;
        _canContinue = true;
        break;
      case 6:
        _canAdd = interestController.text.isNotEmpty;
        _canContinue = true;
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
        _skills.add(
          Skill(
            id: _id,
            title: skillController.text,
          ),
        );
        skillController.clear();
        break;
      case 6:
        _interests.add(
          Interest(
            id: _id,
            title: interestController.text,
          ),
        );
        interestController.clear();
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
    checkActive();
  }

  void removeInterest(Interest interest) {
    _interests.remove(interest);
    checkActive();
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

  // ПОЛУЧИТЬ ЛОКАЛИЗОВННЫЙ ТЕКСТ АППБАРА
  String getTitle(AppLocalizations l) {
    if (_index == 2) return l.languages;
    if (_index == 3) return l.education;
    if (_index == 4) return l.workExperience;
    if (_index == 5) return l.skills;
    if (_index == 6) return l.interests;
    if (_index == 7) return l.aboutYou;
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
    aboutController.dispose();

    for (final list in [
      educationControllers,
      experienceControllers,
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
