import 'package:flutter/material.dart';

class PostTextField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLength;
  final void Function(String) onChanged;

  const PostTextField({
    super.key,
    required this.controller,
    required this.maxLength,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      maxLength: maxLength,
      maxLines: null,
      style: const TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Escribe tu post aquí...',
        hintStyle: TextStyle(color: Colors.grey),
        counterText: '',
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
