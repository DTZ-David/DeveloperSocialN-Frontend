import 'package:flutter/material.dart';

class PostToolbar extends StatelessWidget {
  final VoidCallback onBoldPressed;
  final VoidCallback onItalicPressed;
  final VoidCallback onEmojiPressed;
  final VoidCallback onLinkPressed;
  final VoidCallback onListPressed;
  final VoidCallback onAlignLeftPressed;
  final VoidCallback onUndoPressed;
  final VoidCallback onRedoPressed;
  final VoidCallback onImageAttach;
  final VoidCallback onFileAttach;
  final VoidCallback onTagAdd;
  final int charCount;
  final int maxChars;

  const PostToolbar({
    super.key,
    required this.onBoldPressed,
    required this.onItalicPressed,
    required this.onEmojiPressed,
    required this.onLinkPressed,
    required this.onListPressed,
    required this.onAlignLeftPressed,
    required this.onUndoPressed,
    required this.onRedoPressed,
    required this.onImageAttach,
    required this.onFileAttach,
    required this.onTagAdd,
    required this.charCount,
    required this.maxChars,
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
              _buildButton(Icons.tag, onTagAdd),
              _buildButton(Icons.format_bold, onBoldPressed),
              _buildButton(Icons.format_italic, onItalicPressed),
              _buildButton(Icons.insert_emoticon, onEmojiPressed),
              _buildButton(Icons.link, onLinkPressed),
              _buildButton(Icons.format_list_bulleted, onListPressed),
              _buildButton(Icons.format_align_left, onAlignLeftPressed),
              _buildButton(Icons.undo, onUndoPressed),
              _buildButton(Icons.redo, onRedoPressed),
            ],
          ),
        ),
      ],
    );
  }
}
