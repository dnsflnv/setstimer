import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  static String id = '/about';
  final String about;
  final String history;
  final String version;

  AboutScreen(
      {super.key,
      required this.about,
      required this.history,
      required this.version});

  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    // String about;

    return Scaffold(
      appBar: AppBar(title: const Text('About'), actions: [
        MaterialButton(
          child: const Text('Licenses'),
          onPressed: () => showLicensePage(
              context: context,
              applicationVersion: version,
              applicationLegalese: '© Denis Filonov'),
        )
      ]),
      body: SafeArea(
        child: Markdown(
          data: '$about\n$history',
          controller: controller,
          selectable: false,
          styleSheetTheme: MarkdownStyleSheetBaseTheme.platform,
          onTapLink: (text, href, title) => launchUrl(Uri.parse(href!)),
        ),
      ),
    );
  }
}
