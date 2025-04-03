part of 'resume_bloc.dart';

@immutable
sealed class ResumeEvent {}

final class GetResumes extends ResumeEvent {}

final class AddResume extends ResumeEvent {
  AddResume({required this.resume});

  final Resume resume;
}

final class EditResume extends ResumeEvent {
  EditResume({required this.resume});

  final Resume resume;
}

final class DeleteResume extends ResumeEvent {
  DeleteResume({required this.resume});

  final Resume resume;
}
