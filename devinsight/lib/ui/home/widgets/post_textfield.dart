import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PostTextField extends StatefulWidget {
  final int maxLength;
  final void Function(String) onChanged;
  final TextEditingController controller;

  const PostTextField({
    super.key,
    required this.maxLength,
    required this.onChanged,
    required this.controller,
  });

  @override
  State<PostTextField> createState() => _PostTextFieldState();
}

class _PostTextFieldState extends State<PostTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color:
              _isFocused ? Colors.blue : const Color.fromARGB(255, 36, 37, 37),
          width: 2,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              focusNode: _focusNode,
              onChanged: widget.onChanged,
              maxLength: widget.maxLength,
              maxLines: null,
              minLines: 5,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Escribe el contenido de tu post aquí...',
                hintStyle: TextStyle(color: Colors.grey),
                counterText: '',
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
