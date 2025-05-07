import 'package:devinsight/ui/home/widgets/codePreviewBox.dart';
import 'package:devinsight/ui/home/widgets/publicationHeader.dart';
import 'package:devinsight/ui/home/widgets/reactionsRow.dart';
import 'package:flutter/material.dart';

class PublicationsCard extends StatelessWidget {
  final String userName;
  final String sentAt;
  final String userIcon;
  final String description;
  final String? code; // opcional
  final String? language; // opcional
  final List<int>? reactions; // opcional
  final List<String>? tags; // opcional

  const PublicationsCard({
    super.key,
    required this.userName,
    required this.sentAt,
    required this.userIcon,
    required this.description,
    this.code,
    this.language,
    this.reactions,
    this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      
      color: const Color(0xFF000000),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            PublicationHeader(
              userName: userName,
              sentAt: sentAt,
              userIcon: userIcon,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                description,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 10),
            if (tags != null && tags!.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: tags!
                      .map((tag) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              tag,
                              style: const TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
            if (code != null && language != null) ...[
              SizedBox(
                width: double.infinity,
                child: CodePreviewBox(
                  code: code!,
                  language: language!,
                ),
              ),
              const SizedBox(height: 8),
            ],
            if (reactions != null) ...[
              ReactionsRow(
                reactions: reactions!,
              ),
              const SizedBox(height: 8),
            ],
          ],
        ),
      ),
    );
  }
}
