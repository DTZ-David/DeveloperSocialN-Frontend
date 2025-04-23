// 🔸 Dialogo de opciones
import 'package:flutter/material.dart';

class OptionsDialog extends StatelessWidget {
  const OptionsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Opciones', style: TextStyle(color: Colors.white)),
      backgroundColor: const Color(0xFF1C1A30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.edit, color: Colors.blue),
            title: const Text('Editar', style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.red),
            title: const Text('Eliminar', style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
