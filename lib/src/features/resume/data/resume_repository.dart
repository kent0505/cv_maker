import 'package:sqflite/sqflite.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/resume.dart';

abstract interface class ResumeRepository {
  const ResumeRepository();

  Future<List<Resume>> getResumes();
  Future<void> addResume(Resume resume);
  Future<void> editResume(Resume resume);
  Future<void> deleteResume(Resume resume);
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
  Future<void> addResume(Resume resume) async {
    await _db.insert(Tables.resumes, resume.toMap());
  }

  @override
  Future<void> editResume(Resume resume) async {
    await _db.update(
      Tables.resumes,
      resume.toMap(),
      where: 'id = ?',
      whereArgs: [resume.id],
    );
  }

  @override
  Future<void> deleteResume(Resume resume) async {
    await _db.delete(
      Tables.resumes,
      where: 'id = ?',
      whereArgs: [resume.id],
    );
  }
}
