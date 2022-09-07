part of 'timer_bloc.dart';

@immutable
abstract class TimerState extends Equatable {
  @override
  List<Object> get props => [];
}

class TimerInitial extends TimerState {
  final int sets = 0;
  final int rest = 0;
  final int work = 0;
  final int current = 0;

  @override
  List<Object> get props => [sets, rest, work, current];
}
