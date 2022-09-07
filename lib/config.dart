import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'screens/timer/set_screen.dart';
import 'screens/timer/timer_screen.dart';
import 'screens/timer/train_screen.dart';

/// Place to themes, configuration constants, etc.

/// Material light theme
final ThemeData kMaterialLight = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

/// Material dark theme
final ThemeData kMaterialDark = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.teal,
);

/// Cupertino light & dark theme
var brightness = SchedulerBinding.instance.window.platformBrightness;
bool darkModeOn = brightness == Brightness.dark;

final CupertinoThemeData kCupertinoTheme = CupertinoThemeData(
  brightness: darkModeOn ? Brightness.dark : Brightness.light,
);

/// Route settings

final kInitialRoute = TrainScreen.id;

final Map<String, Widget Function(BuildContext)> kAppRoutes = {
  TrainScreen.id: (context) => const TrainScreen(),
  SetScreen.id: (context) => const SetScreen(),
  TimerScreen.id: (context) => const TimerScreen(),
};
