import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class TimerScreen extends StatelessWidget {
  final int duration;
  final String label;
  final Color color;
  final CountDownController controller;
  final void Function()? onComplete;

  const TimerScreen({
    super.key,
    required this.duration,
    this.onComplete,
    required this.label,
    required this.color,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: Theme.of(context).textTheme.headline6),
          CircularCountDownTimer(
            duration: duration,
            initialDuration: duration,
            controller: controller,
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.height / 1.5,
            fillColor: color,
            backgroundColor: null,
            strokeWidth: 10.0,
            textStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 12,
              color: color,
            ),
            isReverse: true,
            isReverseAnimation: true,
            isTimerTextShown: true,
            onComplete: onComplete,
            ringColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
