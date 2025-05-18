import 'package:devinsight/models/publication/comment_refactor.dart';
import 'package:devinsight/ui/home/widgets/optionsDialog.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InteractionCard extends StatelessWidget {
  final CommentRefactor comment;

  const InteractionCard({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    Widget iconWidget;

    switch (comment.type.toLowerCase()) {
      case 'careful':
        color = Colors.amber;
        iconWidget = SvgPicture.asset(
          'assets/icons/careful.svg',
          width: 20,
          height: 20,
          color: color,
        );
        break;
      case 'comment':
        color = Colors.lightBlue;
        iconWidget = SvgPicture.asset(
          'assets/icons/comments.svg',
          width: 20,
          height: 20,
          color: color,
        );
        break;
      case 'verify':
        color = Colors.green;
        iconWidget = SvgPicture.asset(
          'assets/icons/verified.svg',
          width: 20,
          height: 20,
          color: color,
        );
        break;
      default:
        color = Colors.grey;
        iconWidget = Icon(Icons.info, color: color, size: 20);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: Card(
        color: AppColors.thirdColors,
        margin: EdgeInsets.zero,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundImage: NetworkImage(comment.authorProfilePic),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      comment.authorName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  Text(
                    '#${comment.commentId}',
                    style: const TextStyle(
                      color: Colors.blueAccent,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => const OptionsDialog());
                    },
                    child: const Icon(Icons.more_vert,
                        size: 20, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  iconWidget,
                  const Spacer(),
                  Text(
                    _formatDate(comment.sentAt),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                comment.description,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String _formatDate(DateTime date) {
    // Simple date formatting, adjust as needed
    return '${date.day}/${date.month}/${date.year}';
  }
}
