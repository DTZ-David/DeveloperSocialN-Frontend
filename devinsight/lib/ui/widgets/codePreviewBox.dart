import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_highlight/flutter_highlight.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class CodePreviewBox extends StatelessWidget {
  final String code;
  final String language;

  const CodePreviewBox({super.key, required this.code, required this.language});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff282c34), // Background color
        borderRadius: BorderRadius.circular(10), // Rounded borders
      ),
      padding: const EdgeInsets.all(2),
      child: HighlightView(
        code,
        language: language,
        theme: atomOneDarkTheme,
        padding: const EdgeInsets.all(8),
        textStyle: const TextStyle(
            fontFamily: 'Courier New',
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
