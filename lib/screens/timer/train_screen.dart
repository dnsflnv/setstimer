import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:setstimer/generated/l10n.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:setstimer/screens/about_screen.dart';
import '../../models/set_rest.dart';
import 'set_screen.dart';

class TrainScreen extends StatelessWidget {
  static String id = '/'; //'/train';

  const TrainScreen({super.key});

  Future<String> _loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  /// Preparing data for "About" page
  // ignore: todo
  /// TODO: Change to FutureBuilder
  void getAboutPage(BuildContext context) async {
    Locale myLocale = Localizations.localeOf(context);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    //String appName = packageInfo.appName;
    //String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    //String buildNumber = packageInfo.buildNumber;

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

  @override
  Widget build(BuildContext context) {
    TextEditingController tcSets = TextEditingController(
        text: '${Provider.of<SetRestData>(context).sets}');
    TextEditingController tcRest = TextEditingController(
        text: '${Provider.of<SetRestData>(context).rest}');

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
        actions: [
          MaterialButton(
            child: Text(S.of(context).about),
            onPressed: () {
              getAboutPage(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(S.of(context).sets),
            ChangeIntField(
              value: Provider.of<SetRestData>(context).sets,
              decreaseCallback:
                  Provider.of<SetRestData>(context, listen: false).decreaseSets,
              increaseCallback:
                  Provider.of<SetRestData>(context, listen: false).increaseSets,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(S.of(context).rest),
            ChangeIntField(
              value: Provider.of<SetRestData>(context).rest,
              decreaseCallback:
                  Provider.of<SetRestData>(context, listen: false).decreaseRest,
              increaseCallback:
                  Provider.of<SetRestData>(context, listen: false).increaseRest,
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text(S.of(context).start),
                onPressed: () {
                  int sts = 5;
                  int rst = 90;
                  try {
                    sts = int.parse(tcSets.text);
                  } catch (e) {
                    sts = 0;
                  }
                  try {
                    rst = int.parse(tcRest.text);
                  } catch (e) {
                    rst = 90;
                  }
                  Provider.of<SetRestData>(context, listen: false)
                      .changeSets(sts);
                  Provider.of<SetRestData>(context, listen: false)
                      .changeRest(rst);
                  Provider.of<SetRestData>(context, listen: false)
                      .resetCurrentSet();
                  Navigator.pushNamed(context, SetScreen.id);
                },
              ),
            ),
            // Text(
            //     '${Provider.of<SetRestData>(context, listen: false).sets}'),
          ],
        ),
      ),
    );
  }
}

class ChangeIntField extends StatelessWidget {
  final int value;
  final void Function() increaseCallback;
  final void Function() decreaseCallback;

  const ChangeIntField({
    super.key,
    required this.value,
    required this.decreaseCallback,
    required this.increaseCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: decreaseCallback,
          ),
        ),
        SizedBox(
          width: 60.0,
          child: Text(
            value.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios_rounded),
            onPressed: increaseCallback,
          ),
        ),
      ],
    );
  }
}
