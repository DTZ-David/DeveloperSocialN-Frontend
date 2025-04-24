import 'package:devinsight/ui/widgets/codePreviewBox.dart';
import 'package:devinsight/ui/widgets/reactionsRow.dart';
import 'package:devinsight/ui/widgets/publicationHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🌟 Widget principal
class PublicationsCard extends ConsumerWidget {
  const PublicationsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String codeSnippet = """class Astra {
  public bool CanBypassTejoUlt { get; set; } = true;
  public string GetAdjustment() {
    return "Welcome to new adjustment of Astra.";
""";
    List<int> reactions = [2, 45, 32];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Card(
            shadowColor: Colors.white,
            color: const Color(0xFF0E0B1F),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Color(0xFF1f212a), width: 0.8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const PublicationHeader(),
                  const SizedBox(height: 10),
                  const Text(
                    'Bienvenidos al nuevo ajuste de Astra...',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  CodePreviewBox(code: codeSnippet),
                  const SizedBox(height: 10),
                  ReactionsRow(reactions: reactions),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
