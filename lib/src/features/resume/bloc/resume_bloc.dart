import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/resume.dart';
import '../data/resume_repository.dart';

part 'resume_event.dart';
part 'resume_state.dart';

class ResumeBloc extends Bloc<ResumeEvent, ResumeState> {
  final ResumeRepository _repository;

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
    List<Resume> resumes = await _repository.getResumes();
    emit(ResumesLoaded(resumes: resumes));
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
}
