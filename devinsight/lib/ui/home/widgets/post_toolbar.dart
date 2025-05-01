import 'package:flutter/material.dart';

class PostToolbar extends StatelessWidget {
  final VoidCallback onImageAttach;
  final VoidCallback onFileAttach;

  const PostToolbar({
    super.key,
    required this.onImageAttach,
    required this.onFileAttach,
  });

  Widget _buildButton(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon, size: 20, color: Colors.white),
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 4,
            runSpacing: 4,
            children: [
              _buildButton(Icons.image, onImageAttach),
              _buildButton(Icons.attach_file, onFileAttach),
            ],
          ),
        ),
      ],
    );
  }
}
