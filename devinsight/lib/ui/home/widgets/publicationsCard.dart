import 'package:flutter/material.dart';
import 'package:devinsight/models/publication/post_refactor.dart';
import 'package:devinsight/ui/home/widgets/codePreviewBox.dart';
import 'package:devinsight/ui/home/widgets/publicationHeader.dart';
import 'package:devinsight/ui/home/widgets/reactionsRow.dart';

class PublicationsCard extends StatelessWidget {
  final PostRefactor post;

  const PublicationsCard({
    super.key,
    required this.post,
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
              userName: post.authorUsername,
              sentAt: post.sentAt,
              userIcon: post.profilePicture,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                post.description,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 10),
            if (post.tags.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: post.tags
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
            if (post.codeSnippet.isNotEmpty) ...[
              SizedBox(
                width: double.infinity,
                child: CodePreviewBox(
                  code: post.codeSnippet,
                  language: post.codeLanguage, // o lo que sea apropiado
                ),
              ),
              const SizedBox(height: 8),
            ],
            ReactionsRow(reactionCounts: post.reactionCounts),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
