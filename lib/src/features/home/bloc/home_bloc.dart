import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeTemplates()) {
    on<HomeEvent>(
      (event, emit) => switch (event) {
        ChangeHome() => _changeHome(event, emit),
      },
    );
  }

  void _changeHome(
    ChangeHome event,
    Emitter<HomeState> emit,
  ) {
    if (event.id == 1) emit(HomeTemplates());
    if (event.id == 2) emit(HomeResume());
  }
}
