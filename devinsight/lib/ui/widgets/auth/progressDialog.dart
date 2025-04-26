import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // No permite cerrar tocando fuera
      builder: (BuildContext context) => ProgressDialog(),
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}
