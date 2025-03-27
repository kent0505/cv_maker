import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/settings_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, Locale> {
  final SettingsRepository _repository;
  SettingsBloc({required SettingsRepository repository})
      : _repository = repository,
        super(Locale(PlatformDispatcher.instance.locale.languageCode)) {
    on<SettingsEvent>(
      (event, emit) => switch (event) {
        GetLanguage() => _getLanguage(event, emit),
        SetLanguage() => _setLanguage(event, emit),
      },
    );
  }

  void _getLanguage(
    GetLanguage event,
    Emitter<Locale> emit,
  ) {
    final locale = _repository.getLocale();
    emit(Locale(locale));
  }

  void _setLanguage(
    SetLanguage event,
    Emitter<Locale> emit,
  ) async {
    await _repository.setLocale(event.locale);
    add(GetLanguage());
  }
}
