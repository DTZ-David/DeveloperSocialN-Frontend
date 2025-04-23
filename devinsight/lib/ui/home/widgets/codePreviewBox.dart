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
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      child: HighlightView(
        code,
        language: 'csharp',
        theme: monokaiSublimeTheme,
        padding: const EdgeInsets.all(8),
        textStyle: const TextStyle(fontFamily: 'Courier New', fontSize: 13),
      ),
    );
  }
}
