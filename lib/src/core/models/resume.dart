// import 'education.dart';
// import 'experience.dart';
// import 'honor.dart';
// import 'interest.dart';
// import 'language.dart';
// import 'project.dart';
// import 'skill.dart';

class Resume {
  Resume({
    required this.id,
    required this.template,
    required this.photo,
    required this.name,
    required this.phone,
    required this.email,
    required this.city,
    required this.birth,
    required this.job,
    required this.about,
    // this.languages = const [],
    // this.educations = const [],
    // this.experience = const [],
    // this.projects = const [],
    // this.skills = const [],
    // this.interests = const [],
    // this.honors = const [],
  });

  final int id;
  final int template;
  String photo;
  String name;
  String phone;
  String email;
  String city;
  String birth;
  String job;
  String about;
  // final List<Language> languages;
  // final List<Education> educations;
  // final List<Experience> experience;
  // final List<Project> projects;
  // final List<Skill> skills;
  // final List<Interest> interests;
  // final List<Honor> honors;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'template': template,
      'photo': photo,
      'name': name,
      'phone': phone,
      'email': email,
      'city': city,
      'birth': birth,
      'job': job,
      'about': about,
    };
  }

  factory Resume.fromMap(Map<String, dynamic> map) {
    return Resume(
      id: map['id'],
      template: map['template'],
      photo: map['photo'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      city: map['city'],
      birth: map['birth'],
      job: map['job'],
      about: map['about'],
    );
  }
}
