import 'package:devinsight/ui/widgets/codePreviewBox.dart';
import 'package:devinsight/ui/widgets/publicationHeader.dart';
import 'package:devinsight/ui/widgets/reactionsRow.dart';
import 'package:flutter/material.dart';

class PublicationsCard extends StatelessWidget {
  final String userName;
  final String sentAt;
  final String userIcon;
  final String description;
  final String code;
  final String language;
  final List<int> reactions;
  final List<String> tags;

  const PublicationsCard({
    super.key,
    required this.userName,
    required this.sentAt,
    required this.userIcon,
    required this.description,
    required this.code,
    required this.language,
    required this.reactions,
    required this.tags,
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
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: tags
                    .map((tag) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Row(
                            children: [
                              Text(
                                tag,
                                style: const TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 14,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(
                width: double.infinity,
                child: CodePreviewBox(
                  code: code,
                  language: language,
                )),
            const SizedBox(height: 8),
            ReactionsRow(
              reactions: reactions,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
