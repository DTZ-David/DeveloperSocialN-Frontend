import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReactionsRow extends StatelessWidget {
  final List<int> reactions; // [approved, liked, curious]
  const ReactionsRow({required this.reactions, super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> reactionTypes = [
      {
        'icon': 'assets/icons/verified.svg',
        'color': Colors.greenAccent,
        'count': reactions.isNotEmpty ? reactions[0] : 0,
      },
      {
        'icon': 'assets/icons/careful.svg',
        'color': Colors.yellow,
        'count': reactions.length > 1 ? reactions[1] : 0,
      },
      {
        'icon': 'assets/icons/share.svg',
        'color': Colors.white,
        'count': reactions.length > 2 ? reactions[2] : 0,
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: reactionTypes
                .map((reaction) => Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            reaction['icon'],
                            height: 24,
                            width: 24,
                            // ignore: deprecated_member_use
                            color: reaction['color'],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${reaction['count']}',
                            style: TextStyle(
                                color: reaction['color'],
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: GestureDetector(
              onTap: () => {print("Comentar")},
              child: Container(
                color: const Color(0xFF000000),
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/comments.svg',
                      height: 24,
                      width: 24,
                      // ignore: deprecated_member_use
                      color: Colors.white,
                    ),
                    const SizedBox(width: 6),
                    const Text("Comentar",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat")),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
