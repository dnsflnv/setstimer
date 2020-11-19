import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiplatform_widgets/multiplatform_widgets.dart';
import 'timer_screen.dart';
import 'package:provider/provider.dart';
import '../../models/set_rest.dart';
import 'package:setstimer/generated/l10n.dart';

class SetScreen extends StatelessWidget {
  static const String id = '/set';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MpScaffold(
        appBar: MpAppBar(title: Text(S.of(context).title)),
        body: Container(
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(S.of(context).setsText),
                SizedBox(height: 50),
                Text(
                  '${Provider.of<SetRestData>(context).currentSet} ${S.of(context).from} ${Provider.of<SetRestData>(context).sets}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
                MpButton(
                  label: S.of(context).restButton,
                  onPressed: () {
                    Navigator.pushNamed(context, TimerScreen.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
