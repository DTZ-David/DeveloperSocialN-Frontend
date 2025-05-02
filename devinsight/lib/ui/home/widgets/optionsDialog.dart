import 'package:flutter/material.dart';

class OptionsDialog extends StatelessWidget {
  const OptionsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(
            'Opciones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4),
          Divider(color: Colors.black26),
        ],
      ),
      backgroundColor: Colors.white, // Fondo blanco para un look limpio
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opción 1
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Padding(
              padding:  EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children:  [
                  Icon(Icons.edit, color: Colors.blueAccent),
                  SizedBox(width: 12),
                  Text(
                    'Opción #1',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Opción 2
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Padding(
              padding:  EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children:  [
                  Icon(Icons.delete, color: Colors.redAccent),
                  SizedBox(width: 12),
                  Text(
                    'Opción #2',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
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
