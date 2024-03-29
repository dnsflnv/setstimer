import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:setstimer/presentation/screens/timer_screen.dart';

import '../../generated/l10n.dart';
import '../../logic/bloc/timer_bloc.dart';
import 'about_screen.dart';
import 'start_screen.dart';

class MainScreen extends StatelessWidget {
  static String id = '/';

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<TimerBloc, TimerState>(
          builder: (context, state) {
            if (state is Work) {
              return Text(
                S.of(context).work,
                style: const TextStyle(color: Colors.redAccent),
              );
            } else if (state is Rest) {
              return Text(
                S.of(context).rest,
                style: const TextStyle(color: Colors.greenAccent),
              );
            }
            return Text(S.of(context).title);
          },
        ),
        actions: [
          MaterialButton(
            child: const Icon(Icons.help_outline),
            onPressed: () {
              getAboutPage(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<TimerBloc, TimerState>(
            builder: (context, state) {
              if (state is Initial) {
                return StartScreen(state: state);
              } else if (state is Work) {
                return TimerScreen(
                  key: UniqueKey(),
                  duration: state.work,
                  color: Colors.redAccent,
                  label: S.of(context).work,
                  onComplete: () {
                    context.read<TimerBloc>().add(WorkTimerFinished());
                  },
                );
              } else if (state is Rest) {
                return TimerScreen(
                  key: UniqueKey(),
                  duration: state.rest,
                  color: Colors.greenAccent,
                  label: S.of(context).rest,
                  onComplete: () {
                    context.read<TimerBloc>().add(RestTimerFinished());
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  /// Preparing data for "About" page
  // ignore: todo
  /// TODO: Change to FutureBuilder
  void getAboutPage(BuildContext context) async {
    Locale myLocale = Localizations.localeOf(context);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;

    String about = await _loadAsset('assets/texts/$myLocale/about.md');
    about = about.replaceAll('%version%', version);
    String history = await _loadAsset('CHANGELOG.md');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AboutScreen(
            about: about,
            history: history,
            version: version,
          );
        },
      ),
    );
  }

  Future<String> _loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }
}
