part of 'resume_bloc.dart';

@immutable
sealed class ResumeState {}

final class ResumeInitial extends ResumeState {}

final class ResumesLoaded extends ResumeState {
  ResumesLoaded({
    required this.resumes,
    required this.stage,
  });

  final List<Resume> resumes;
  final Stage stage;
}
