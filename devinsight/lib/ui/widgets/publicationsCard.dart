import 'package:devinsight/ui/widgets/publicationHeader.dart';
import 'package:flutter/material.dart';

class PublicationsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath;
  final String description;
  final String code;
  final List<int> reactions;

  const PublicationsCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.description,
    required this.code,
    required this.reactions,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF000000),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            PublicationHeader(
              userName: title,
              subtitle: subtitle,
              iconPath: iconPath,
            ),
            const SizedBox(height: 10),
            Text(description, style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              color: const Color(0xFF1E1E2F),
              padding: const EdgeInsets.all(10),
              child: Text(code,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 87, 241, 67),
                      fontFamily: 'monospace')),
            ),
            const SizedBox(height: 10),
            Row(
              children: reactions
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text('🔥 $e',
                            style: const TextStyle(color: Colors.white70)),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
