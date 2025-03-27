import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/config/constants.dart';

abstract interface class SettingsRepository {
  const SettingsRepository();

  String getLocale();
  Future<void> setLocale(String locale);
}

final class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  String getLocale() {
    final code = PlatformDispatcher.instance.locale.languageCode;
    List<String> codes = ['en', 'ru'];
    return _prefs.getString(Keys.locale) ??
        (codes.contains(code) ? code : 'en');
  }

  @override
  Future<void> setLocale(String locale) async {
    await _prefs.setString(Keys.locale, locale);
  }
}
