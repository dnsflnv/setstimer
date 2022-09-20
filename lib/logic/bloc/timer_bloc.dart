import 'package:equatable/equatable.dart';
import 'package:setstimer/utils/play_sound.dart';
import 'package:wakelock/wakelock.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc()
      : super(const Initial(
            sets: 4, rest: 120, work: 60, isWork: true, current: 0)) {
    on<SetsChanged>((event, emit) => emit(state.copyWith(sets: event.sets)));
    on<WorkChanged>((event, emit) => emit(state.copyWith(work: event.work)));
    on<RestChanged>((event, emit) => emit(state.copyWith(rest: event.rest)));
    on<StartPressed>(_onStartPressed);
    on<WorkTimerFinished>(_onWorkTimerFinished);
    on<RestTimerFinished>(_onRestTimerFinished);
    on<StopPressed>(_onStopPressed);
  }

  void _onStopPressed(event, emit) {
    Wakelock.disable();
    emit(Initial(
        sets: state.sets,
        rest: state.rest,
        work: state.work,
        isWork: state.isWork,
        current: 0));
  }

  void _onStartPressed(event, emit) {
    Wakelock.enable();
    playSoundAndVibrate();
    emit(Work(
      sets: state.sets,
      work: state.work,
      rest: state.rest,
      isWork: true,
      current: 1,
    ));
  }

  void _onWorkTimerFinished(event, emit) {
    playSoundAndVibrate();
    emit(Rest(
      sets: state.sets,
      work: state.work,
      rest: state.rest,
      isWork: false,
      current: state.current,
    ));
  }

  void _onRestTimerFinished(event, emit) {
    playSoundAndVibrate();
    if (state.current == state.sets) {
      Wakelock.disable();
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
