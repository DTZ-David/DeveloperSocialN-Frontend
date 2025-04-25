import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';

class CodePreviewBox extends StatelessWidget {
  final String code;

  const CodePreviewBox({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF000000),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      child: HighlightView(
        code,
        language: 'csharp',
        theme: monokaiSublimeTheme,
        padding: const EdgeInsets.all(8),
        textStyle: const TextStyle(fontFamily: 'Courier New', fontSize: 15),
      ),
    );
  }
}
