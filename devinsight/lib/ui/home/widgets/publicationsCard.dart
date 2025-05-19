import 'package:devinsight/models/publication/post.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:devinsight/ui/home/widgets/codePreviewBox.dart';
import 'package:devinsight/ui/home/widgets/publicationHeader.dart';
import 'package:devinsight/ui/home/widgets/reactionsRow.dart';

class PublicationsCard extends StatelessWidget {
  final Post post;

  const PublicationsCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.thirdColors,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.secondaryColors,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                PublicationHeader(
                  userName: post.userName,
                  sentAt: post.fechaPublicacion,
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
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.secondaryColors,
                                      width: 2,
                                    ),
                                    color: const Color(0xFF000000),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    tag,
                                    style: const TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                    ),
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
                      language: post.codeLanguage,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
                ReactionsRow(reactionCounts: post.reactions, postId: post.id,),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
