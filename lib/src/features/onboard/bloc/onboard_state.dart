part of 'onboard_bloc.dart';

@immutable
sealed class OnboardState {}

final class OnboardInitial extends OnboardState {}

final class OnboardLoaded extends OnboardState {
  OnboardLoaded({
    required this.onboard,
    required this.index,
  });

  final Onboard? onboard;
  final int index;
}

final class OnboardDone extends OnboardState {}
