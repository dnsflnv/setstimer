import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setstimer/logic/bloc/timer_bloc.dart';
import 'package:steps_indicator/steps_indicator.dart';

class TimerScreen extends StatelessWidget {
  final int duration;
  final String label;
  final Color color;
  final void Function()? onComplete;

  const TimerScreen({
    super.key,
    required this.duration,
    this.onComplete,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    CountDownController controller = CountDownController();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 80.0,
            child: BlocBuilder<TimerBloc, TimerState>(
              builder: (context, state) {
                final maxSet = state.sets;
                final currentSet = state.current - 1;
                int mSet = maxSet - 1;
                double maxLineLength = MediaQuery.of(context).size.width * 0.65;
                double linelength = maxLineLength;
                if (mSet > 1) {
                  linelength =
                      maxLineLength / (mSet) - 14 / (mSet) - 10 / (mSet) * mSet;
                  if (linelength < 0) {
                    linelength = 0;
                  }
                }
                return StepsIndicator(
                  lineLength: linelength,
                  selectedStep: currentSet,
                  nbSteps: maxSet,
                  selectedStepColorIn: Colors.transparent,
                  selectedStepColorOut: color,
                  unselectedStepColorIn: color,
                  unselectedStepColorOut: color,
                  doneStepColor: color,
                  doneLineColor: color,
                  undoneLineColor: color,
                );
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: CircularCountDownTimer(
                autoStart: true,
                duration: duration,
                controller: controller,
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 1.5,
                fillColor: color,
                textStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 12,
                  color: color,
                ),
                isReverse: true,
                isReverseAnimation: true,
                isTimerTextShown: true,
                onComplete: onComplete,
                ringColor: Colors.grey[300]!, // Colors.transparent,
                strokeCap: StrokeCap.round,
                strokeWidth: 25.0,
                backgroundColor: null,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 42),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          context.read<TimerBloc>().add(StopPressed()),
                      child: const Icon(Icons.stop),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.isPaused) {
                          controller.isPaused = false;
                          controller.resume();
                          return;
                        }
                        controller.pause();
                      },
                      child: const Icon(Icons.pause),
                    ),
                    ElevatedButton(
                      onPressed: () => controller.reset(),
                      child: const Icon(Icons.fast_forward),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
