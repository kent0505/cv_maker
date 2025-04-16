import 'package:sqflite/sqflite.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/data.dart';
import '../../../core/models/education.dart';
import '../../../core/models/experience.dart';
import '../../../core/models/honor.dart';
import '../../../core/models/interest.dart';
import '../../../core/models/language.dart';
import '../../../core/models/project.dart';
import '../../../core/models/resume.dart';
import '../../../core/models/skill.dart';
import '../../../core/utils.dart';

abstract interface class ResumeRepository {
  const ResumeRepository();

  Future<Data> getData();
  Future<void> addResume(Data data);
  Future<void> editResume(Data data);
  Future<void> deleteResume(Resume resume);
  Future<void> applyResumeTemplate(Resume resume);
}

final class ResumeRepositoryImpl implements ResumeRepository {
  ResumeRepositoryImpl({required Database db}) : _db = db;

  final Database _db;

  @override
  Future<Data> getData() async {
    final resumes = await _db.query(Tables.resumes);
    final languages = await _db.query(Tables.languages);
    final educations = await _db.query(Tables.educations);
    final experiences = await _db.query(Tables.experiences);
    final projects = await _db.query(Tables.projects);
    final skills = await _db.query(Tables.skills);
    final interests = await _db.query(Tables.interests);
    final honors = await _db.query(Tables.honors);

    logger('RESUMES ${resumes.length}');
    logger('LANGUAGES ${languages.length}');
    logger('EDUCATIONS ${educations.length}');
    logger('EXPERIENCES ${experiences.length}');
    logger('PROJECTS ${projects.length}');
    logger('SKILLS ${skills.length}');
    logger('INTERESTS ${interests.length}');
    logger('HONORS ${honors.length}');

    return Data(
      resumes: resumes.map((map) => Resume.fromMap(map)).toList(),
      languages: languages.map((map) => Language.fromMap(map)).toList(),
      educations: educations.map((map) => Education.fromMap(map)).toList(),
      experiences: experiences.map((map) => Experience.fromMap(map)).toList(),
      projects: projects.map((map) => Project.fromMap(map)).toList(),
      skills: skills.map((map) => Skill.fromMap(map)).toList(),
      interests: interests.map((map) => Interest.fromMap(map)).toList(),
      honors: honors.map((map) => Honor.fromMap(map)).toList(),
    );
  }

  @override
  Future<void> addResume(Data data) async {
    try {
      await _db.insert(Tables.resumes, data.resume!.toMap());
      for (var language in data.languages) {
        await _db.insert(Tables.languages, language.toMap());
      }
      for (var education in data.educations) {
        await _db.insert(Tables.educations, education.toMap());
      }
      for (var experience in data.experiences) {
        await _db.insert(Tables.experiences, experience.toMap());
      }
      for (var project in data.projects) {
        await _db.insert(Tables.projects, project.toMap());
      }
      for (var skill in data.skills) {
        await _db.insert(Tables.skills, skill.toMap());
      }
      for (var interest in data.interests) {
        await _db.insert(Tables.interests, interest.toMap());
      }
      for (var honor in data.honors) {
        await _db.insert(Tables.honors, honor.toMap());
      }
    } catch (e) {
      logger(e);
    }
  }

  @override
  Future<void> editResume(Data data) async {
    try {
      final resume = data.resume!;
      final id = resume.id;

      await _db.delete(Tables.languages, where: 'id = ?', whereArgs: [id]);
      await _db.delete(Tables.educations, where: 'id = ?', whereArgs: [id]);
      await _db.delete(Tables.experiences, where: 'id = ?', whereArgs: [id]);
      await _db.delete(Tables.projects, where: 'id = ?', whereArgs: [id]);
      await _db.delete(Tables.skills, where: 'id = ?', whereArgs: [id]);
      await _db.delete(Tables.interests, where: 'id = ?', whereArgs: [id]);
      await _db.delete(Tables.honors, where: 'id = ?', whereArgs: [id]);

      await _db.update(
        Tables.resumes,
        resume.toMap(),
        where: 'id = ?',
        whereArgs: [resume.id],
      );
      for (var language in data.languages) {
        await _db.insert(Tables.languages, language.toMap());
      }
      for (var education in data.educations) {
        await _db.insert(Tables.educations, education.toMap());
      }
      for (var experience in data.experiences) {
        await _db.insert(Tables.experiences, experience.toMap());
      }
      for (var project in data.projects) {
        await _db.insert(Tables.projects, project.toMap());
      }
      for (var skill in data.skills) {
        await _db.insert(Tables.skills, skill.toMap());
      }
      for (var interest in data.interests) {
        await _db.insert(Tables.interests, interest.toMap());
      }
      for (var honor in data.honors) {
        await _db.insert(Tables.honors, honor.toMap());
      }
    } catch (e) {
      logger(e);
    }
  }

  @override
  Future<void> deleteResume(Resume resume) async {
    final id = resume.id;
    await _db.delete(Tables.resumes, where: 'id = ?', whereArgs: [id]);
    await _db.delete(Tables.languages, where: 'id = ?', whereArgs: [id]);
    await _db.delete(Tables.educations, where: 'id = ?', whereArgs: [id]);
    await _db.delete(Tables.experiences, where: 'id = ?', whereArgs: [id]);
    await _db.delete(Tables.projects, where: 'id = ?', whereArgs: [id]);
    await _db.delete(Tables.skills, where: 'id = ?', whereArgs: [id]);
    await _db.delete(Tables.interests, where: 'id = ?', whereArgs: [id]);
    await _db.delete(Tables.honors, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<void> applyResumeTemplate(Resume resume) async {
    await _db.update(
      Tables.resumes,
      resume.toMap(),
      where: 'id = ?',
      whereArgs: [resume.id],
    );
  }
}
