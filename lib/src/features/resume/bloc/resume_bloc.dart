import 'package:cv_maker/src/core/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/resume.dart';
import '../data/resume_repository.dart';

part 'resume_event.dart';
part 'resume_state.dart';

class ResumeBloc extends Bloc<ResumeEvent, ResumeState> {
  final ResumeRepository _repository;

  List<Resume> resumes = [];
  Stage stage = Stage.information;

  ResumeBloc({required ResumeRepository repository})
      : _repository = repository,
        super(ResumeInitial()) {
    on<ResumeEvent>(
      (event, emit) => switch (event) {
        GetResumes() => _getResumes(event, emit),
        AddResume() => _addResume(event, emit),
        EditResume() => _editResume(event, emit),
        DeleteResume() => _deleteResume(event, emit),
        ChangeResumeStage() => _changeResumeStage(event, emit),
      },
    );
  }

  void _getResumes(
    GetResumes event,
    Emitter<ResumeState> emit,
  ) async {
    resumes = await _repository.getResumes();
    emit(ResumesLoaded(
      resumes: resumes,
      stage: stage,
    ));
  }

  void _addResume(
    AddResume event,
    Emitter<ResumeState> emit,
  ) async {
    await _repository.addResume(event.resume);
    add(GetResumes());
  }

  void _editResume(
    EditResume event,
    Emitter<ResumeState> emit,
  ) async {
    await _repository.editResume(event.resume);
    add(GetResumes());
  }

  void _deleteResume(
    DeleteResume event,
    Emitter<ResumeState> emit,
  ) async {
    await _repository.deleteResume(event.resume);
    add(GetResumes());
  }

  void _changeResumeStage(
    ChangeResumeStage event,
    Emitter<ResumeState> emit,
  ) async {
    final stages = Stage.values;
    final currentIndex = stages.indexOf(stage);
    logger(currentIndex);
    if (event.right && currentIndex < stages.length - 1) {
      stage = stages[currentIndex + 1];
    } else if (!event.right && currentIndex > 0) {
      stage = stages[currentIndex - 1];
    }
    emit(ResumesLoaded(
      resumes: resumes,
      stage: stage,
    ));
  }
}

enum Stage {
  information,
  language,
  education,
  experience,
  projects,
  skills,
  software,
  interests,
  honors,
  about,
}
