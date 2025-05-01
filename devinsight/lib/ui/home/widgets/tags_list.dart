import 'package:flutter/material.dart';

class TagList extends StatefulWidget {
  final List<String> tags;
  final void Function(String) onTagAdded;
  final void Function(String) onTagRemoved;

  const TagList({
    super.key,
    required this.tags,
    required this.onTagAdded,
    required this.onTagRemoved,
  });

  @override
  State<TagList> createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  final TextEditingController _tagController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_updateFocusState);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_updateFocusState);
    _focusNode.dispose();
    _tagController.dispose();
    super.dispose();
  }

  void _updateFocusState() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _handleSubmitted(String value) {
    final trimmed = value.trim();
    final isValidTag = RegExp(r'^[a-zA-Z0-9]+$').hasMatch(trimmed);

    if (isValidTag &&
        trimmed.length <= 15 &&
        !widget.tags.contains("#$trimmed")) {
      widget.onTagAdded("#$trimmed");
    }
    _tagController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 14),
        const Text(
          'Tags:',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        _buildInputField(),
        const SizedBox(height: 12),
        _buildTagList(),
      ],
    );
  }

  Widget _buildInputField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color:
              _isFocused ? Colors.blue : const Color.fromARGB(255, 36, 37, 37),
          width: 2,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: _tagController,
        focusNode: _focusNode,
        onSubmitted: _handleSubmitted,
        style: const TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Escribe tags...',
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }

  Widget _buildTagList() {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: widget.tags.map((tag) => _buildTagChip(tag)).toList(),
    );
  }

  void _showDeleteConfirmation(String tag) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              'Eliminar tag',
              style: TextStyle(
                  fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
            ),
          ),
          content: Text(
            '¿Deseas eliminar "$tag"?',
            style: const TextStyle(
                fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancelar',
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                widget.onTagRemoved(tag);
              },
              child: const Text(
                'Eliminar',
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTagChip(String tag) {
    return GestureDetector(
      onLongPress: () {
        _showDeleteConfirmation(tag);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: const Color.fromARGB(255, 36, 37, 37),
            width: 2,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Text(
          tag,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
