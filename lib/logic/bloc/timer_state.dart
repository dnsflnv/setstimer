part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  final int sets;
  final int rest;
  final int work;
  final bool isWork;
  final int current;

  const TimerState({
    required this.sets,
    required this.rest,
    required this.work,
    required this.isWork,
    required this.current,
  });

  @override
  List<Object> get props => [sets, rest, work, isWork, current];

  TimerState copyWith({int sets, int work, int rest, bool isWork, int current});
}

class Initial extends TimerState {
  const Initial(
      {required super.sets,
      required super.rest,
      required super.work,
      required super.isWork,
      required super.current});

  @override
  TimerState copyWith(
      {int? sets, int? rest, int? work, bool? isWork, int? current}) {
    return Initial(
      sets: sets ?? this.sets,
      rest: rest ?? this.rest,
      work: work ?? this.work,
      isWork: isWork ?? this.isWork,
      current: current ?? this.current,
    );
  }
}

class Work extends TimerState {
  const Work(
      {required super.sets,
      required super.rest,
      required super.work,
      required super.isWork,
      required super.current});

  @override
  TimerState copyWith(
      {int? sets, int? rest, int? work, bool? isWork, int? current}) {
    return Work(
      sets: sets ?? this.sets,
      rest: rest ?? this.rest,
      work: work ?? this.work,
      isWork: isWork ?? this.isWork,
      current: current ?? this.current,
    );
  }
}

class Rest extends TimerState {
  const Rest(
      {required super.sets,
      required super.rest,
      required super.work,
      required super.isWork,
      required super.current});

  @override
  TimerState copyWith(
      {int? sets, int? rest, int? work, bool? isWork, int? current}) {
    return Work(
      sets: sets ?? this.sets,
      rest: rest ?? this.rest,
      work: work ?? this.work,
      isWork: isWork ?? this.isWork,
      current: current ?? this.current,
    );
  }
}
