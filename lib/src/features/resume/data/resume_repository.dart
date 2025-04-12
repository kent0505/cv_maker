import 'package:sqflite/sqflite.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/education.dart';
import '../../../core/models/experience.dart';
import '../../../core/models/honor.dart';
import '../../../core/models/interest.dart';
import '../../../core/models/language.dart';
import '../../../core/models/project.dart';
import '../../../core/models/resume.dart';
import '../../../core/models/skill.dart';

abstract interface class ResumeRepository {
  const ResumeRepository();

  Future<void> addResume(
    final Resume resume,
    final List<Language> languages,
    final List<Education> educations,
    final List<Experience> experiences,
    final List<Project> projects,
    final List<Skill> skills,
    final List<Interest> interests,
    final List<Honor> honors,
  );
  Future<void> editResume(final Resume resume);
  Future<void> deleteResume(final Resume resume);
  Future<List<Resume>> getResumes();
  Future<List<Language>> getLanguages();
  Future<List<Education>> getEducations();
  Future<List<Experience>> getExperiences();
  Future<List<Project>> getProjects();
  Future<List<Skill>> getSkills();
  Future<List<Interest>> getInterests();
  Future<List<Honor>> getHonors();
}

final class ResumeRepositoryImpl implements ResumeRepository {
  ResumeRepositoryImpl({required Database db}) : _db = db;

  final Database _db;

  @override
  Future<void> addResume(
    final Resume resume,
    final List<Language> languages,
    final List<Education> educations,
    final List<Experience> experiences,
    final List<Project> projects,
    final List<Skill> skills,
    final List<Interest> interests,
    final List<Honor> honors,
  ) async {
    await _db.insert(Tables.resumes, resume.toMap());
    for (var language in languages) {
      await _db.insert(Tables.languages, language.toMap());
    }
    for (var education in educations) {
      await _db.insert(Tables.educations, education.toMap());
    }
    for (var experience in experiences) {
      await _db.insert(Tables.experiences, experience.toMap());
    }
    for (var project in projects) {
      await _db.insert(Tables.projects, project.toMap());
    }
    for (var skill in skills) {
      await _db.insert(Tables.skills, skill.toMap());
    }
    for (var interest in interests) {
      await _db.insert(Tables.interests, interest.toMap());
    }
    for (var honor in honors) {
      await _db.insert(Tables.honors, honor.toMap());
    }
  }

  @override
  Future<void> editResume(final Resume resume) async {
    await _db.update(
      Tables.resumes,
      resume.toMap(),
      where: 'id = ?',
      whereArgs: [resume.id],
    );
  }

  @override
  Future<void> deleteResume(final Resume resume) async {
    await _db.delete(
      Tables.resumes,
      where: 'id = ?',
      whereArgs: [resume.id],
    );
  }

  @override
  Future<List<Resume>> getResumes() async {
    final resumes = await _db.query(Tables.resumes);
    return resumes.map((map) => Resume.fromMap(map)).toList();
  }

  @override
  Future<List<Language>> getLanguages() async {
    final languages = await _db.query(Tables.languages);
    return languages.map((map) => Language.fromMap(map)).toList();
  }

  @override
  Future<List<Education>> getEducations() async {
    final educations = await _db.query(Tables.educations);
    return educations.map((map) => Education.fromMap(map)).toList();
  }

  @override
  Future<List<Experience>> getExperiences() async {
    final experiences = await _db.query(Tables.experiences);
    return experiences.map((map) => Experience.fromMap(map)).toList();
  }

  @override
  Future<List<Project>> getProjects() async {
    final projects = await _db.query(Tables.projects);
    return projects.map((map) => Project.fromMap(map)).toList();
  }

  @override
  Future<List<Skill>> getSkills() async {
    final skills = await _db.query(Tables.skills);
    return skills.map((map) => Skill.fromMap(map)).toList();
  }

  @override
  Future<List<Interest>> getInterests() async {
    final interests = await _db.query(Tables.interests);
    return interests.map((map) => Interest.fromMap(map)).toList();
  }

  @override
  Future<List<Honor>> getHonors() async {
    final honors = await _db.query(Tables.honors);
    return honors.map((map) => Honor.fromMap(map)).toList();
  }
}
