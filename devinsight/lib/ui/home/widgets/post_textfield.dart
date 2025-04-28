import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border:
            Border.all(color: const Color.fromARGB(255, 36, 37, 37), width: 2),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/pencil.svg',
            height: 24,
            width: 24,
            // ignore: deprecated_member_use
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Expanded(
              child: TextField(
            controller: controller,
            onChanged: onChanged,
            maxLength: maxLength,
            maxLines: null,
            style:
                const TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Escribe el contenido de tu post aquí...',
              hintStyle: TextStyle(color: Colors.grey),
              counterText: '',
              contentPadding: EdgeInsets.zero,
            ),
          )),
        ],
      ),
    );
  }
}
