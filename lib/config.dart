import 'package:flutter/material.dart';
import 'screens/timer/set_screen.dart';
import 'screens/timer/timer_screen.dart';
import 'screens/timer/train_screen.dart';

/// Place to themes, configuration constants, etc.

/// Material light theme
final ThemeData kMaterialLight = ThemeData(
  useMaterial3: true,
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

/// Material dark theme
final ThemeData kMaterialDark = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primarySwatch: Colors.teal,
);

/// Route settings

final kInitialRoute = TrainScreen.id;

final Map<String, Widget Function(BuildContext)> kAppRoutes = {
  TrainScreen.id: (context) => const TrainScreen(),
  SetScreen.id: (context) => const SetScreen(),
  TimerScreen.id: (context) => const TimerScreen(),
};
