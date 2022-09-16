import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setstimer/utils/play_sound.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc()
      : super(const Initial(
            sets: 4, rest: 3, work: 3, isWork: true, current: 0)) {
    on<SetsChanged>((event, emit) => emit(state.copyWith(sets: event.sets)));
    on<WorkChanged>((event, emit) => emit(state.copyWith(work: event.work)));
    on<RestChanged>((event, emit) => emit(state.copyWith(rest: event.rest)));
    on<StartPressed>(_onStartPressed);
    on<WorkTimerFinished>(_onWorkTimerFinished);
    on<RestTimerFinished>(_onRestTimerFinished);
  }

  void _onStartPressed(event, emit) {
    emit(Work(
      sets: state.sets,
      work: state.work,
      rest: state.rest,
      isWork: true,
      current: 1,
    ));
  }

  void _onWorkTimerFinished(event, emit) {
    playSound();
    emit(Rest(
      sets: state.sets,
      work: state.work,
      rest: state.rest,
      isWork: false,
      current: state.current,
    ));
  }

  void _onRestTimerFinished(event, emit) {
    playSound();
    if (state.current == state.sets) {
      emit(Initial(
          sets: state.sets,
          rest: state.rest,
          work: state.work,
          isWork: state.isWork,
          current: 0));
    } else {
      emit(Work(
        sets: state.sets,
        work: state.work,
        rest: state.rest,
        isWork: true,
        current: state.current + 1,
      ));
    }
  }
}
