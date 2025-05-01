import 'package:flutter/material.dart';

class InteractionCard extends StatelessWidget {
  final String tipo;
  final String id;
  final String mensaje;

  const InteractionCard({
    super.key,
    required this.tipo,
    required this.id,
    required this.mensaje,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    IconData icon;

    switch (tipo.toLowerCase()) {
      case 'mejora':
        color = Colors.amber;
        icon = Icons.tips_and_updates;
        break;
      case 'comentarios':
        color = Colors.lightBlue;
        icon = Icons.comment;
        break;
      case 'confirmacion':
        color = Colors.green;
        icon = Icons.check_circle;
        break;
      default:
        color = Colors.grey;
        icon = Icons.info;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
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
                  Icon(icon, color: color, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    tipo,
                    style: TextStyle(fontWeight: FontWeight.bold, color: color),
                  ),
                  const Spacer(),
                  Text(
                    '#$id',
                    style: const TextStyle(color: Colors.blueAccent),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.more_vert, size: 20, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(mensaje, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
