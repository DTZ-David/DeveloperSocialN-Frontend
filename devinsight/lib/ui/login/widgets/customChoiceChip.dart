import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final IconData icon;
  final VoidCallback onSelected;

  const CustomChoiceChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.icon,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      avatar: Icon(
        icon,
        color: Colors.white,
        size: 18,
      ),
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onSelected(),
      labelStyle: const TextStyle(color: Colors.white),
      backgroundColor: Colors.grey[850],
      selectedColor: Colors.deepPurpleAccent, // Puedes parametrizar también si quieres
    );
  }
}
