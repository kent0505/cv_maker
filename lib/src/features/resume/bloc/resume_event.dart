part of 'resume_bloc.dart';

@immutable
sealed class ResumeEvent {}

final class GetResumes extends ResumeEvent {}

final class AddResume extends ResumeEvent {
  AddResume({
    required this.resume,
    required this.languages,
    required this.educations,
    required this.experiences,
    required this.projects,
    required this.skills,
    required this.interests,
    required this.honors,
  });

  final Resume resume;
  final List<Language> languages;
  final List<Education> educations;
  final List<Experience> experiences;
  final List<Project> projects;
  final List<Skill> skills;
  final List<Interest> interests;
  final List<Honor> honors;
}

final class EditResume extends ResumeEvent {
  EditResume({required this.resume});

  final Resume resume;
}

final class DeleteResume extends ResumeEvent {
  DeleteResume({required this.resume});

  final Resume resume;
}
