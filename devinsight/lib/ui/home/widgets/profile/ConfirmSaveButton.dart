import 'package:flutter/material.dart';

class ConfirmSaveButton extends StatelessWidget {
  final VoidCallback onSave;

  const ConfirmSaveButton({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: false, // Para que no se cierre tocando fuera
          builder: (context) {
            return AlertDialog(
              backgroundColor: const Color(0xFF181A20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Text(
                "Confirmar cambios",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat",
                ),
              ),
              content: const Text(
                "¿Estás seguro de que quieres guardar los cambios?",
                style: TextStyle(
                  color: Colors.white70,
                  fontFamily: "Montserrat",
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Cierra el diálogo
                  },
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(
                      color: Colors.white70,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Cierra el diálogo
                    onSave(); // Ejecuta la función para guardar cambios
                  },
                  child: const Text(
                    "Guardar",
                    style: TextStyle(
                      color: Color(0xFF1ABCFE),
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: const Text(
        "Guardar cambios",
        style: TextStyle(
          color: Color(0xFF1ABCFE),
          fontWeight: FontWeight.bold,
          fontFamily: "Montserrat",
        ),
      ),
    );
  }
}
