import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InteractionDialog extends ConsumerWidget {
  final String title;
  final String message;
  final VoidCallback? onConfirm;
  final String confirmText;
  final String cancelText;

  const InteractionDialog({
    Key? key,
    required this.title,
    required this.message,
    this.onConfirm,
    this.confirmText = 'OK',
    this.cancelText = 'Cancel',
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(
                fontFamily: 'Montserrat',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    cancelText,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontFamily: 'Montserrat'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(confirmText),
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (onConfirm != null) onConfirm!();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Usage example:
// showDialog(
//   context: context,
//   builder: (context) => InteractionDialog(
//     title: 'Confirm Action',
//     message: 'Are you sure you want to proceed?',
//     onConfirm: () { /* your logic */ },
//   ),
// );