part of 'resume_bloc.dart';

@immutable
sealed class ResumeEvent {}

final class GetResumes extends ResumeEvent {}

final class AddResume extends ResumeEvent {
  AddResume({required this.data});

  final Data data;
}

final class EditResume extends ResumeEvent {
  EditResume({required this.data});

  final Data data;
}

final class DeleteResume extends ResumeEvent {
  DeleteResume({required this.resume});

  final Resume resume;
}

final class ApplyResumeTemplate extends ResumeEvent {
  ApplyResumeTemplate({
    required this.template,
    required this.resume,
  });

  final Template template;
  final Resume resume;
}
