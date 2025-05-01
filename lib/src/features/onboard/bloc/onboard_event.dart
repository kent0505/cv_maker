part of 'onboard_bloc.dart';

@immutable
sealed class OnboardEvent {}

final class GetOnboard extends OnboardEvent {}

final class ChangeOnboard extends OnboardEvent {
  ChangeOnboard({this.index = 0});

  final int index;
}
