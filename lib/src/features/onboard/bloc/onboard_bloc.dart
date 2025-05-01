import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/onboard.dart';
import '../data/onboard_repository.dart';

part 'onboard_event.dart';
part 'onboard_state.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  final OnboardRepository _repository;

  Onboard? onboard;
  int index = 1;

  OnboardBloc({required OnboardRepository repository})
      : _repository = repository,
        super(OnboardInitial()) {
    on<OnboardEvent>(
      (event, emit) => switch (event) {
        GetOnboard() => _getOnboard(event, emit),
        ChangeOnboard() => _changeOnboard(event, emit),
      },
    );
  }

  void _getOnboard(
    GetOnboard event,
    Emitter<OnboardState> emit,
  ) async {
    onboard = await _repository.getOnboard();
    emit(OnboardLoaded(
      onboard: onboard,
      index: index,
    ));
  }

  void _changeOnboard(
    ChangeOnboard event,
    Emitter<OnboardState> emit,
  ) async {
    if (event.index == 0) {
      if (index == 3) {
        await _repository.removeOnboard();
        emit(OnboardDone());
      } else {
        index++;
        emit(OnboardLoaded(
          onboard: onboard,
          index: index,
        ));
      }
    } else {
      index = event.index;
      emit(OnboardLoaded(
        onboard: onboard,
        index: index,
      ));
    }
  }
}
