// 🔸 Dialogo para compartir
import 'package:flutter/material.dart';

class ShareDialog extends StatelessWidget {
  const ShareDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Center(
          child: Text('Compartir', style: TextStyle(color: Color.fromARGB(255, 250, 250, 250)))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.facebook, color: Colors.blue, size: 40),
              Icon(Icons.telegram, color: Colors.blue, size: 40),
              Icon(Icons.email, color: Colors.blue, size: 40),
            ],
          )
        ],
      ),
    );
  }
}
