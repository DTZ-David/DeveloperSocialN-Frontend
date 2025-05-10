import 'package:devinsight/config/providers/interaction_provider.dart';
import 'package:devinsight/ui/home/widgets/interactionsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentModal {
  static const int maxWords = 50;

  static Future<String?> show(BuildContext context) async {
    IconData _selectedIcon = Icons.comment;
    final TextEditingController _commentController = TextEditingController();

    return await showModalBottomSheet<String>(
        elevation: 2,
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
              child: Consumer(
                builder: (context, ref, _) {
                  final interactions = ref.watch(interactionsProvider);

                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon:
                                  const Icon(Icons.close, color: Colors.white),
                              onPressed: () async {
                                bool discard =
                                    await _showConfirmationDialog(context);
                                if (discard) Navigator.pop(context);
                              },
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 10),
                              itemCount: interactions.length,
                              itemBuilder: (context, index) {
                                final interaction = interactions[index];
                                return InteractionCard(
                                  tipo: interaction['tipo'],
                                  id: interaction['id'],
                                  mensaje: interaction['mensaje'],
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // ComboBox con íconos
                              DropdownButtonHideUnderline(
                                child: DropdownButton<IconData>(
                                  value: _selectedIcon,
                                  items: [
                                    Icons.comment,
                                    Icons.star,
                                    Icons.warning,
                                    Icons.lightbulb,
                                  ].map((iconData) {
                                    return DropdownMenuItem<IconData>(
                                      value: iconData,
                                      child:
                                          Icon(iconData, color: Colors.white),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      setState(() {
                                        _selectedIcon = value;
                                      });
                                    }
                                  },
                                  dropdownColor: Colors.grey[850],
                                  iconEnabledColor: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 8),

                              // TextField más pequeño
                              Expanded(
                                child: SizedBox(
                                  height: 40, // Altura controlada
                                  child: TextField(
                                    controller: _commentController,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 14),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                      hintText: 'Escribe tu comentario...',
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.blueAccent),
                                      ),
                                      fillColor: Colors.black,
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              
                            ],
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
                                  horizontal: 24, vertical: 10),
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
                  );
                },
              ),
            ),
          );
        });
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
                    Navigator.pop(context, false);
                  },
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text(
                    'Descartar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        ) ??
        false;
  }
}
