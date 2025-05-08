
import 'package:devinsight/ui/home/widgets/interactionsCard.dart';
import 'package:flutter/material.dart';

class CommentModal {
  static const int maxWords = 50;

  static Future<String?> show(BuildContext context) async {
    final TextEditingController _commentController = TextEditingController();

    return await showModalBottomSheet<String>(
      barrierColor: Colors.white.withOpacity(0.33),
      enableDrag: false,
      isDismissible: false,
      transitionAnimationController: AnimationController(
        vsync: Navigator.of(context),
        duration: const Duration(milliseconds: 1000),
      ),
      showDragHandle: true,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 16,
              right: 16,
              top: 20,
            ),
            child: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          bool discard = await _showConfirmationDialog(context);
                          if (discard) {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                    const InteractionCard(
                      tipo: 'Comentarios',
                      id: 'Comentario',
                      mensaje:
                          '¿Qué te parece la nueva funcionalidad de DevInsight?',
                    ),
                    const Text(
                      'Agregar comentario',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    const SizedBox(height: 12),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.4,
                      ),
                      child: Scrollbar(
                        child: SingleChildScrollView(
                          child: TextField(
                            controller: _commentController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Escribe tu comentario...',
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Colors.blueAccent),
                              ),
                              fillColor: Colors.black,
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        final comment = _commentController.text.trim();
                        if (comment.isNotEmpty) {
                          Navigator.pop(context, comment);
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 10.0),
                        child: Text(
                          'Publicar',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  static Future<bool> _showConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.black,
              title: const Text('Descartar comentario'),
              content: const Text(
                  '¿Estás seguro de que deseas descartar el comentario?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false); // No descartar
                  },
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(
                        color: Colors
                            .white), // Establece el color blanco para el texto
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true); // Descartar
                  },
                  child: const Text(
                    'Descartar',
                    style: TextStyle(
                        color: Colors
                            .white), // Establece el color blanco para el texto
                  ),
                ),
              ],
            );
          },
        ) ??
        false; // Si el usuario cierra sin seleccionar, devuelve false.
  }
}
