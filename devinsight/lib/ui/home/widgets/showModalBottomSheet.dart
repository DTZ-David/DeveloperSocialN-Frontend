import 'package:devinsight/config/providers/interaction_provider.dart';
import 'package:devinsight/ui/home/widgets/interactionsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommentModal extends ConsumerWidget {
  static Future<Map<String, String>?> show(BuildContext context) async {
    return await showModalBottomSheet<Map<String, String>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const CommentModal(),
    );
  }

  const CommentModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController commentController = TextEditingController();
    final Map<String, String> iconsMap = {
      'assets/icons/careful.svg': 'Mejora',
      'assets/icons/verified.svg': 'Verificar',
    };
    final interactions = ref.watch(interactionsProvider);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 12,
      ),
      child: StatefulBuilder(
        builder: (context, setState) {
          String selectedSvg = iconsMap.keys.first;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag handle
              Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              // Interactions list
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
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

              // Enhanced comment input with icon
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // SVG dropdown
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        setState(() {
                          selectedSvg = value;
                          print(selectedSvg);
                        });
                      },
                      color: const Color(0xFF1E1E1E),
                      icon: SvgPicture.asset(
                        selectedSvg,
                        height: 24,
                        width: 24,
                        color: Colors.white,
                      ),
                      itemBuilder: (context) => iconsMap.entries
                          .map((entry) => PopupMenuItem<String>(
                                value: entry.key,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      entry.key,
                                      height: 24,
                                      width: 24,
                                      color: entry.value == 'Mejora'
                                          ? Colors.yellow
                                          : Colors.green,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      entry.value,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),

                    const SizedBox(width: 8),

                    // Text input
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: TextField(
                          controller: commentController,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Escribe tu comentario...',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                          ),
                        ),
                      ),
                    ),

                    // Submit button
                    GestureDetector(
                      onTap: () {
                        final comment = commentController.text.trim();
                        if (comment.isNotEmpty) {
                          final result = {
                            'tipo': iconsMap[selectedSvg]!,
                            'comentario': comment,
                          };
                          Navigator.pop(context, result);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset(
                          'assets/icons/send.svg',
                          height: 24,
                          width: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
