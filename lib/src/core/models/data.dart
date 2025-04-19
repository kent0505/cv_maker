import 'resume.dart';
import 'language.dart';
import 'education.dart';
import 'experience.dart';
import 'skill.dart';
import 'interest.dart';

class Data {
  Data({
    this.resume,
    this.resumes = const [],
    required this.languages,
    required this.educations,
    required this.experiences,
    required this.skills,
    required this.interests,
  });

  final Resume? resume;
  final List<Resume> resumes;
  final List<Language> languages;
  final List<Education> educations;
  final List<Experience> experiences;
  final List<Skill> skills;
  final List<Interest> interests;
}

final emptyData = Data(
  languages: [],
  educations: [],
  experiences: [],
  skills: [],
  interests: [],
);
