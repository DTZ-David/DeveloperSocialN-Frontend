// 🔸 Fila de reacciones y compartir
import 'package:devinsight/ui/home/widgets/ShareDialog.dart';
import 'package:flutter/material.dart';

class ReactionsRow extends StatelessWidget {
  final List<int> reactions;
  const ReactionsRow({required this.reactions, super.key});

  Widget _buildReaction(IconData icon, int count, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 4),
        Text('$count', style: TextStyle(color: color, fontSize: 14)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _buildReaction(Icons.check_circle, reactions[0], Colors.greenAccent),
            const SizedBox(width: 8),
            _buildReaction(Icons.favorite, reactions[1], Colors.yellow),
            const SizedBox(width: 8),
            _buildReaction(Icons.mood, reactions[2], Colors.blueAccent),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.share, color: Colors.white),
          onPressed: () => showDialog(context: context, builder: (_) => const ShareDialog()),
        )
      ],
    );
  }
}
