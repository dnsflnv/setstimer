import 'package:flutter/material.dart';
import 'timer_screen.dart';
import 'package:provider/provider.dart';
import '../../models/set_rest.dart';
import 'package:setstimer/generated/l10n.dart';

class SetScreen extends StatelessWidget {
  static const String id = '/set';

  const SetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).title)),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  S.of(context).setsText,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 50),
              Text(
                '${Provider.of<SetRestData>(context).currentSet} ${S.of(context).from} ${Provider.of<SetRestData>(context).sets}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                child: Text(S.of(context).restButton),
                onPressed: () {
                  Navigator.pushNamed(context, TimerScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
