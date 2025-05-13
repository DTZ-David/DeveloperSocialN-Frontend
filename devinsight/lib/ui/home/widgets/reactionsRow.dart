import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:devinsight/ui/home/widgets/showModalBottomSheet.dart';

class ReactionsRow extends StatelessWidget {
  final Map<String, int> reactionCounts;

  const ReactionsRow({super.key, required this.reactionCounts});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> reactionTypes = [
      {
        'icon': 'assets/icons/verified.svg',
        'color': Colors.greenAccent,
        'label': 'verified',
        'count': reactionCounts['verified'] ?? 0,
      },
      {
        'icon': 'assets/icons/careful.svg',
        'color': Colors.yellow,
        'label': 'careful',
        'count': reactionCounts['careful'] ?? 0,
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: reactionTypes.map((reaction) {
              return Padding(
                padding: const EdgeInsets.only(right: 14),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      reaction['icon'],
                      height: 24,
                      width: 24,
                      color: reaction['color'],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${reaction['count']}',
                      style: TextStyle(
                        color: reaction['color'],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          GestureDetector(
            onTap: () async {
              final comment = await CommentModal.show(context);
              if (comment != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Comentario guardado'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            child: Container(
              color: const Color(0xFF000000),
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/comments.svg',
                    height: 24,
                    width: 24,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    "Comentar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
