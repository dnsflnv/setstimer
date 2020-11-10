import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setstimer/config.dart';
import 'package:setstimer/generated/l10n.dart';
import 'package:setstimer/screens/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// Localization

void main() {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS)) {
    runApp(AppCupertino());
  } else {
    runApp(AppMaterial());
  }
}

Map<String, Widget Function(BuildContext)> appRoutes = {
  HomeScreen.id: (context) => HomeScreen(),
};

class AppMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (BuildContext context) => S.of(context).title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        buttonColor: Colors.blue,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
      ),
      initialRoute: HomeScreen.id,
      routes: appRoutes,
    );
  }
}

class AppCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (BuildContext context) => S.of(context).title,
      theme: cupertinoTheme(),
      initialRoute: HomeScreen.id,
      routes: appRoutes,
    );
  }
}
