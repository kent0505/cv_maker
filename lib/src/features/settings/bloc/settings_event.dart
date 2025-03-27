part of 'settings_bloc.dart';

@immutable
sealed class SettingsEvent {}

final class GetLanguage extends SettingsEvent {}

final class SetLanguage extends SettingsEvent {
  SetLanguage({required this.locale});

  final String locale;
}
