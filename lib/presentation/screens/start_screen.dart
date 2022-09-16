import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../generated/l10n.dart';
import '../../logic/bloc/timer_bloc.dart';
import '../widgets/spin_edit.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
    required this.state,
  });

  final TimerState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SpinEditInt(
          label: S.of(context).sets,
          initialValue: state.sets,
          onChange: (val) =>
              context.read<TimerBloc>().add(SetsChanged(val.toInt())),
        ),
        const SizedBox(
          height: 40,
        ),
        SpinEditInt(
          label: S.of(context).work,
          initialValue: state.work,
          onChange: (val) =>
              context.read<TimerBloc>().add(WorkChanged(val.toInt())),
        ),
        const SizedBox(
          height: 40,
        ),
        SpinEditInt(
          label: S.of(context).rest,
          initialValue: state.rest,
          onChange: (val) =>
              context.read<TimerBloc>().add(RestChanged(val.toInt())),
        ),
        const SizedBox(
          height: 40,
        ),
        ElevatedButton(
          child: Text(S.of(context).start),
          onPressed: () => context.read<TimerBloc>().add(StartPressed()),
        ),
      ],
    );
  }
}
