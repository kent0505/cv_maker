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
  static const gotham700 = 'gotham700';
  static const gotham900 = 'gotham900';
}

abstract final class Assets {
  static const arrow = 'assets/arrow.svg';
  static const bottom = 'assets/bottom.svg';
  static const close = 'assets/close.svg';
  static const left = 'assets/left.svg';
  static const menu = 'assets/menu.svg';
  static const resume = 'assets/resume.svg';
  static const right = 'assets/right.svg';
  static const settings = 'assets/settings.svg';
  static const templates = 'assets/templates.svg';
  static const email = 'assets/email.svg';
  static const location = 'assets/location.svg';
  static const phone = 'assets/phone.svg';
  static const figure1 = 'assets/figure1.svg';
  static const figure2 = 'assets/figure2.svg';
  static const line1 = 'assets/line1.svg';
  static const line2 = 'assets/line2.svg';

  static const onb1 = 'assets/images/onb1.png';
  static const onb2 = 'assets/images/onb2.png';
  static const onb3 = 'assets/images/onb3.png';
  static const onb4 = 'assets/images/onb4.png';
  static const onb5 = 'assets/images/onb5.png';
  static const star = 'assets/images/star.png';
  static const placeholder = 'assets/images/placeholder.png';
  static const user = 'assets/images/user.png';

  static String getTemplate(int id) => 'assets/templates/$id.png';
}

abstract final class Keys {
  static const onboard = 'onboard';
  static const locale = 'locale';
}

abstract final class Locales {
  static const en = 'en';
  static const ru = 'ru';
  static const cs = 'cs';
  static const de = 'de';
  static const es = 'es';
  static const fr = 'fr';
  static const it = 'it';
  static const pl = 'pl';
}

abstract final class Levels {
  static const a1 = 'A1';
  static const a2 = 'A2';
  static const b1 = 'B1';
  static const b2 = 'B2';
  static const c1 = 'C1';
  static const c2 = 'Native';
}

abstract final class FileFormats {
  static const jpg = 'JPG';
  static const png = 'PNG';
  static const pdf = 'PDF';
}

abstract final class Tables {
  static const resumes = 'resumes';
  static const languages = 'languages';
  static const educations = 'educations';
  static const experiences = 'experiences';
  static const skills = 'skills';
  static const interests = 'interests';
}

abstract final class SQL {
  static const resumes = '''
    CREATE TABLE IF NOT EXISTS ${Tables.resumes} (
      id INTEGER,
      template INTEGER,
      photo TEXT,
      name TEXT,
      phone TEXT,
      email TEXT,
      city TEXT,
      birth TEXT,
      job TEXT,
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
      startYear TEXT,
      endYear TEXT
    )
    ''';
  static const experiences = '''
    CREATE TABLE IF NOT EXISTS ${Tables.experiences} (
      id INTEGER,
      company TEXT,
      location TEXT,
      introduction TEXT,
      details TEXT,
      startDate TEXT,
      endDate TEXT,
      present INTEGER
    )
    ''';
  static const skills = '''
    CREATE TABLE IF NOT EXISTS ${Tables.skills} (
      id INTEGER,
      title TEXT
    )
    ''';
  static const interests = '''
    CREATE TABLE IF NOT EXISTS ${Tables.interests} (
      id INTEGER,
      title TEXT
    )
    ''';
}
