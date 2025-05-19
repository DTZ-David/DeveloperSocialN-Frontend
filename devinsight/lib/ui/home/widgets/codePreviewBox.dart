import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CodePreviewBox extends StatelessWidget {
  final String code;
  final String language;
  final int collapsedLines;

  const CodePreviewBox({
    super.key,
    required this.code,
    required this.language,
    this.collapsedLines = 6,
  });

  @override
  Widget build(BuildContext context) {
    final lines = code.trimRight().split('\n');
    final isLong = lines.length > collapsedLines;
    final visibleCode = isLong ? lines.take(collapsedLines).join('\n') : code;

    return Stack(
      children: [
        // Highlight code viewer (fondo)
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xff282c34),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8),
          child: HighlightView(
            visibleCode,
            language: language,
            theme: atomOneDarkTheme,
            padding: EdgeInsets.zero,
            textStyle: const TextStyle(
              fontFamily: 'Courier New',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Botón de expandir sobrepuesto (si es necesario)
        if (isLong)
          Positioned(
            right: 8,
            top: 8,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: const Color(0xff282c34),
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  builder: (context) {
                    return DraggableScrollableSheet(
                      initialChildSize: 0.8,
                      minChildSize: 0.5,
                      maxChildSize: 0.95,
                      expand: false,
                      builder: (_, controller) {
                        return SizedBox.expand(
                          child: Column(
                            children: [
                              const SizedBox(height: 12),
                              // Barra de arrastre (drag handle)
                              Container(
                                width: 40,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Expanded(
                                child: SingleChildScrollView(
                                  controller: controller,
                                  padding: const EdgeInsets.all(16),
                                  child: HighlightView(
                                    code,
                                    language: language,
                                    theme: atomOneDarkTheme,
                                    padding: EdgeInsets.zero,
                                    textStyle: const TextStyle(
                                      fontFamily: 'Courier New',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.all(4),
                child: SvgPicture.asset(
                  'assets/icons/expand-full.svg',
                  height: 24,
                  width: 24,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
