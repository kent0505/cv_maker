export 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract final class AppFonts {
  static const inter400 = 'inter400';
  static const inter500 = 'inter500';
  static const inter700 = 'inter700';
  static const inter900 = 'inter900';

  static const funnel400 = 'funnel400';
  static const funnel500 = 'funnel500';
  static const funnel600 = 'funnel600';
  static const funnel700 = 'funnel700';
  static const funnel800 = 'funnel800';

  static const gotham400 = 'gotham400';
  static const gotham500 = 'gotham500';
  static const gotham700 = 'gotham700';
  static const gotham900 = 'gotham900';
}

abstract final class Assets {
  static const arrow = 'assets/arrow.svg';
  static const bottom = 'assets/bottom.svg';
  static const close = 'assets/close.svg';
  static const edit = 'assets/edit.svg';
  static const left = 'assets/left.svg';
  static const menu = 'assets/menu.svg';
  static const resume = 'assets/resume.svg';
  static const right = 'assets/right.svg';
  static const settings = 'assets/settings.svg';
  static const templates = 'assets/templates.svg';
  static const tip = 'assets/tip.svg';

  static const onb1 = 'assets/images/onb1.png';
  static const onb2 = 'assets/images/onb2.png';
  static const onb3 = 'assets/images/onb3.png';
  static const onb4 = 'assets/images/onb4.png';
  static const onb5 = 'assets/images/onb5.png';
  static const star = 'assets/images/star.png';
  static const user = 'assets/images/user.png';

  static const template1 = 'assets/templates/1.png';
  static const template2 = 'assets/templates/2.png';
  static const template3 = 'assets/templates/3.png';
  static const template4 = 'assets/templates/4.png';
  static const template5 = 'assets/templates/5.png';
  static const template6 = 'assets/templates/6.png';
  static const template7 = 'assets/templates/7.png';
  static const template8 = 'assets/templates/8.png';
  static const template9 = 'assets/templates/9.png';
  static const template10 = 'assets/templates/10.png';
  static const template11 = 'assets/templates/11.png';
  static const template12 = 'assets/templates/12.png';
  static const template13 = 'assets/templates/13.png';
  static const template14 = 'assets/templates/14.png';
  static const template15 = 'assets/templates/15.png';
  static const template16 = 'assets/templates/16.png';
  static const template17 = 'assets/templates/17.png';
  static const template18 = 'assets/templates/18.png';
  static const template19 = 'assets/templates/19.png';
  static const template20 = 'assets/templates/20.png';
}

abstract final class Keys {
  static const onboard = 'onboard';
  static const locale = 'locale';
}

abstract final class Locales {
  static const en = 'en';
  static const ru = 'ru';
}

abstract final class Levels {
  static const a1 = 'A1';
  static const a2 = 'A2';
  static const b1 = 'B1';
  static const b2 = 'B2';
  static const c1 = 'C1';
  static const c2 = 'C2';
}

abstract final class Tables {
  static const resumes = 'resumes';
  static const languages = 'languages';
  static const educations = 'educations';
  static const experiences = 'experiences';
  static const projects = 'projects';
  static const skills = 'skills';
  static const softwares = 'softwares';
  static const interests = 'interests';
  static const honors = 'honors';
}

abstract final class SQL {
  static const resumes = '''
    CREATE TABLE IF NOT EXISTS ${Tables.resumes} (
      id INTEGER,
      photo TEXT,
      name TEXT,
      phone TEXT,
      email TEXT,
      city TEXT,
      birth TEXT,
      job TEXT,
      languageID INTEGER,
      educationID INTEGER,
      experienceID INTEGER,
      projectID INTEGER,
      skillID INTEGER,
      softwareID INTEGER,
      interestID INTEGER,
      honorID INTEGER,
      about TEXT
    )
    ''';
  static const languages = '''
    CREATE TABLE IF NOT EXISTS ${Tables.languages} (
      id INTEGER,
      language TEXT,
      level TEXT
    )
    ''';
  static const educations = '''
    CREATE TABLE IF NOT EXISTS ${Tables.educations} (
      id INTEGER,
      name TEXT,
      faculty TEXT,
      specialization TEXT,
      startYear INTEGER,
      endYear INTEGER
    )
    ''';
  static const experiences = '''
    CREATE TABLE IF NOT EXISTS ${Tables.experiences} (
      id INTEGER,
      company TEXT,
      location TEXT,
      introduction TEXT,
      details TEXT,
      startYear TEXT,
      endYear TEXT
    )
    ''';
  static const projects = '''
    CREATE TABLE IF NOT EXISTS ${Tables.projects} (
      id INTEGER,
      name TEXT,
      startYear TEXT,
      endYear TEXT,
      details TEXT
    )
    ''';
  static const skills = '''
    CREATE TABLE IF NOT EXISTS ${Tables.skills} (
      id INTEGER,
      title TEXT
    )
    ''';
  static const softwares = '''
    CREATE TABLE IF NOT EXISTS ${Tables.softwares} (
      id INTEGER,
      title TEXT,
      level TEXT
    )
    ''';
  static const interests = '''
    CREATE TABLE IF NOT EXISTS ${Tables.interests} (
      id INTEGER,
      title TEXT
    )
    ''';
  static const honors = '''
    CREATE TABLE IF NOT EXISTS ${Tables.honors} (
      id INTEGER,
      title TEXT
    )
    ''';
}
