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

  Future<List<Resume>> getResumes();
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
}

final class ResumeRepositoryImpl implements ResumeRepository {
  ResumeRepositoryImpl({required Database db}) : _db = db;

  final Database _db;

  @override
  Future<List<Resume>> getResumes() async {
    final maps = await _db.query(Tables.resumes);
    return maps.map((map) => Resume.fromMap(map)).toList();
  }

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
}
