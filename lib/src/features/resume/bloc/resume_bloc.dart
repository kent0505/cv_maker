import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/education.dart';
import '../../../core/models/experience.dart';
import '../../../core/models/honor.dart';
import '../../../core/models/interest.dart';
import '../../../core/models/language.dart';
import '../../../core/models/project.dart';
import '../../../core/models/resume.dart';
import '../../../core/models/skill.dart';
import '../data/resume_repository.dart';

part 'resume_event.dart';
part 'resume_state.dart';

class ResumeBloc extends Bloc<ResumeEvent, ResumeState> {
  final ResumeRepository _repository;

  List<Resume> resumes = [];
  List<Language> languages = [];
  List<Education> educations = [];
  List<Experience> experiences = [];
  List<Project> projects = [];
  List<Skill> skills = [];
  List<Interest> interests = [];
  List<Honor> honors = [];

  ResumeBloc({required ResumeRepository repository})
      : _repository = repository,
        super(ResumeInitial()) {
    on<ResumeEvent>(
      (event, emit) => switch (event) {
        GetResumes() => _getResumes(event, emit),
        AddResume() => _addResume(event, emit),
        EditResume() => _editResume(event, emit),
        DeleteResume() => _deleteResume(event, emit),
      },
    );
  }

  void _getResumes(
    GetResumes event,
    Emitter<ResumeState> emit,
  ) async {
    resumes = await _repository.getResumes();
    languages = await _repository.getLanguages();
    educations = await _repository.getEducations();
    experiences = await _repository.getExperiences();
    projects = await _repository.getProjects();
    skills = await _repository.getSkills();
    interests = await _repository.getInterests();
    honors = await _repository.getHonors();
    emit(ResumesLoaded(resumes: resumes));
  }

  void _addResume(
    AddResume event,
    Emitter<ResumeState> emit,
  ) async {
    await _repository.addResume(
      event.resume,
      event.languages,
      event.educations,
      event.experiences,
      event.projects,
      event.skills,
      event.interests,
      event.honors,
    );
    add(GetResumes());
  }

  void _editResume(
    EditResume event,
    Emitter<ResumeState> emit,
  ) async {
    // await _repository.editResume(event.resume);
    add(GetResumes());
  }

  void _deleteResume(
    DeleteResume event,
    Emitter<ResumeState> emit,
  ) async {
    await _repository.deleteResume(event.resume);
    add(GetResumes());
  }
}
