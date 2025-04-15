import 'resume.dart';
import 'language.dart';
import 'education.dart';
import 'experience.dart';
import 'project.dart';
import 'skill.dart';
import 'interest.dart';
import 'honor.dart';

class Data {
  Data({
    this.resume,
    this.resumes = const [],
    required this.languages,
    required this.educations,
    required this.experiences,
    required this.projects,
    required this.skills,
    required this.interests,
    required this.honors,
  });

  final Resume? resume;
  final List<Resume> resumes;
  final List<Language> languages;
  final List<Education> educations;
  final List<Experience> experiences;
  final List<Project> projects;
  final List<Skill> skills;
  final List<Interest> interests;
  final List<Honor> honors;
}

final emptyData = Data(
  languages: [],
  educations: [],
  experiences: [],
  projects: [],
  skills: [],
  interests: [],
  honors: [],
);
