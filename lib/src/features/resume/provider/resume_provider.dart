import 'package:cv_maker/src/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/config/constants.dart';

export 'package:provider/provider.dart';

class ResumeProvider extends ChangeNotifier {
  int index = 1;
  String imagePath = '';
  String name = '';
  String phone = '';
  String email = '';
  String city = '';
  String birth = '';
  String job = '';

  void pickImage() async {
    final file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    imagePath = file?.path ?? '';
    notifyListeners();
  }

  void setBirth(DateTime date) {
    birth = dateToString(date);
    notifyListeners();
  }

  void onClose() {
    index = 1;
    notifyListeners();
  }

  void goLeft() {
    index--;
    notifyListeners();
  }

  void goRight() {
    index++;
    notifyListeners();
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
}
