import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiplatform_widgets/multiplatform_widgets.dart';
import 'package:setstimer/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  static String id = '/';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MpScaffold(
        appBar: MpAppBar(title: Text(S.of(context).title)),
        body: Container(
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(),
          ),
        ),
      ),
    );
  }
}
