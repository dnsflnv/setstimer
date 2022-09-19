part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class StartPressed extends TimerEvent {}

class WorkTimerFinished extends TimerEvent {}

class RestTimerFinished extends TimerEvent {}

class SetsChanged extends TimerEvent {
  final int sets;

  const SetsChanged(this.sets);

  @override
  List<Object> get props => [sets];
}

class WorkChanged extends TimerEvent {
  final int work;

  const WorkChanged(this.work);

  @override
  List<Object> get props => [work];
}

class RestChanged extends TimerEvent {
  final int rest;

  const RestChanged(this.rest);

  @override
  List<Object> get props => [rest];
}
