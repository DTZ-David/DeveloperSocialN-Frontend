import 'package:flutter/material.dart';

class SimplePostCard extends StatefulWidget {
  final String userName;
  final String sentAt;
  final String userIcon;
  final String description;

  const SimplePostCard({
    super.key,
    required this.userName,
    required this.sentAt,
    required this.userIcon,
    required this.description,
  });

  @override
  State<SimplePostCard> createState() => _SimplePostCardState();
}

class _SimplePostCardState extends State<SimplePostCard> {
  int likes = 0;
  int comments = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF000000),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.userIcon),
                  radius: 18,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.sentAt,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert, color: Colors.white70),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Description
            Text(
              widget.description,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
          
            const Text(
              "#python #fastAPI #programming #work #hectorl4",
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 10),
            // Likes and Comments
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      likes++;
                    });
                  },
                  icon: const Icon(Icons.favorite_border, color: Colors.white),
                ),
                Text(
                  '$likes',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.comment_outlined, color: Colors.white),
                ),
                Text( 
                  
                  '$comments',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
