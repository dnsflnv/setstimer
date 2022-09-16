import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:setstimer/logic/bloc/timer_bloc.dart';
import 'package:window_size/window_size.dart';
import 'dart:io' show Platform;

import 'generated/l10n.dart';
import 'models/set_rest.dart';
import 'presentation/screens/main_screen.dart';
import 'theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Sets interval timer');
    setWindowMaxSize(const Size(1024, 768));
    setWindowMinSize(const Size(400, 500));
  }

  runApp(
    BlocProvider(
      create: (context) => TimerBloc(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SetRestData()),
        ],
        child: const App(),
      ),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (BuildContext context) => S.of(context).title,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const MainScreen(),
    );
  }
}
