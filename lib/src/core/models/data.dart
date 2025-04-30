import '../config/constants.dart';
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

Data getMockData(int template) {
  return Data(
    resume: Resume(
      id: 0,
      template: template,
      photo: Assets.user,
      name: 'Yulia Kartavenko',
      phone: '1-718-310-5588',
      email: 'yourmail@example.com',
      city: 'your address psum suspendisse ultrices gravida. Risus commodo',
      birth: '22/06/2000',
      job: 'UI/UX, Web-designer',
      about:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
    ),
    languages: [
      Language(id: 0, language: 'Language', level: '1'),
      Language(id: 0, language: 'Language', level: '2'),
      Language(id: 0, language: 'Language', level: '3'),
    ],
    educations: [
      Education(
        id: 0,
        name: 'STANFORD UNIVERSITY',
        faculty: 'MASTER DEGREE GRADUATE',
        startYear: '2011',
        endYear: '2015',
      ),
      Education(
        id: 0,
        name: 'UNIVERSITY OF CHICAGO',
        faculty: 'BACHELOR DEGREE GRADUATE',
        startYear: '2007',
        endYear: '2011',
      ),
    ],
    experiences: [
      Experience(
        id: 0,
        company: 'Creative Agency',
        location: 'Chicago',
        introduction: 'SENIOR WEB DESIGNER',
        details:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
        startDate: '22/06/2022',
        endDate: '22/06/2050',
        present: true,
      ),
      Experience(
        id: 0,
        company: 'Creative Agency',
        location: 'Chicago',
        introduction: 'SENIOR WEB DESIGNER',
        details:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
        startDate: '22/06/2015',
        endDate: '22/06/2020',
        present: false,
      ),
      Experience(
        id: 0,
        company: 'Creative Agency',
        location: 'Chicago',
        introduction: 'SENIOR WEB DESIGNER',
        details:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
        startDate: '22/06/2020',
        endDate: '22/06/2024',
        present: false,
      ),
    ],
    skills: [
      Skill(id: 0, title: 'SKILL ONE'),
      Skill(id: 0, title: 'SKILL TWO'),
      Skill(id: 0, title: 'SKILL THREE'),
      Skill(id: 0, title: 'SKILL FOUR'),
      Skill(id: 0, title: 'SKILL FIVE'),
      Skill(id: 0, title: 'SKILL SIX'),
      Skill(id: 0, title: 'SKILL SEVEN'),
      Skill(id: 0, title: 'SKILL EIGHT'),
    ],
    interests: [
      Interest(id: 0, title: 'INTEREST ONE'),
      Interest(id: 0, title: 'INTEREST TWO'),
      Interest(id: 0, title: 'INTEREST THREE'),
      Interest(id: 0, title: 'INTEREST FOUR'),
      Interest(id: 0, title: 'INTEREST FIVE'),
      Interest(id: 0, title: 'INTEREST SIX'),
      Interest(id: 0, title: 'INTEREST SEVEN'),
      Interest(id: 0, title: 'INTEREST EIGHT'),
    ],
  );
}
