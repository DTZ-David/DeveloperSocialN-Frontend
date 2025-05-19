import 'package:devinsight/config/providers/auth_provider.dart';
import 'package:devinsight/config/providers/comment_refactor_provider.dart';
import 'package:devinsight/models/publication/comment.dart';
import 'package:devinsight/models/publication/comment_request.dart';
import 'package:devinsight/models/user/user.dart';
import 'package:devinsight/ui/home/widgets/interactionsCard.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommentModal extends ConsumerWidget {
  final String postId;

  const CommentModal({super.key, required this.postId});

  static Future<Map<String, String>?> show(
      BuildContext context, String postId) {
    return showModalBottomSheet<Map<String, String>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.thirdColors,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => CommentModal(postId: postId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(authProvider).user;
    final commentController = TextEditingController();
    final iconsMap = {
      'assets/icons/careful.svg': 'Mejora',
      'assets/icons/verified.svg': 'Verificar',
      'assets/icons/comments.svg': 'Comentario',
    };
    final comments = ref.watch(commentsByPostIdProvider(postId));

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 12,
      ),
      child: _CommentModalContent(
        commentController: commentController,
        iconsMap: iconsMap,
        comments: comments,
        postId: postId,
        user: user,
        ref: ref,
      ),
    );
  }
}

class _CommentModalContent extends StatefulWidget {
  final TextEditingController commentController;
  final Map<String, String> iconsMap;
  final AsyncValue<List<dynamic>> comments;
  final String postId;
  final User user;
  final WidgetRef ref;

  const _CommentModalContent({
    required this.commentController,
    required this.iconsMap,
    required this.comments,
    required this.postId,
    required this.user,
    required this.ref,
  });

  @override
  State<_CommentModalContent> createState() => _CommentModalContentState();
}

class _CommentModalContentState extends State<_CommentModalContent> {
  late String selectedSvg;

  @override
  void initState() {
    super.initState();
    selectedSvg = widget.iconsMap.keys.first;
  }

  @override
  void dispose() {
    widget.commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          child: RefreshIndicator(
            onRefresh: () async {
              await widget.ref
                  // ignore: unused_result
                  .refresh(commentsByPostIdProvider(widget.postId).future);
            },
            child: widget.comments.when(
              data: (commentsList) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: commentsList.length,
                  itemBuilder: (context, index) {
                    final comment = commentsList[index];
                    return InteractionCard(comment: comment);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Enhanced comment input with icon
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SVG dropdown
              PopupMenuButton<String>(
                onSelected: (value) {
                  setState(() {
                    selectedSvg = value;
                  });
                },
                color: const Color(0xFF1E1E1E),
                icon: SvgPicture.asset(
                  selectedSvg,
                  height: 24,
                  width: 24,
                  color: Colors.white,
                ),
                itemBuilder: (context) => widget.iconsMap.entries
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
                                    : entry.value == 'Comentario'
                                        ? Colors.blue
                                        : entry.value == 'Verificar'
                                            ? Colors.green
                                            : Colors.white,
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
                    controller: widget.commentController,
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
                  final comment = widget.commentController.text.trim();

                  if (comment.isNotEmpty) {
                    final tipo = widget.iconsMap[selectedSvg];
                    final interactionType = {
                      'Mejora': 'careful',
                      'Verificar': 'verify',
                      'Comentario': 'comment',
                    }[tipo]!;

                    final commentToSend = CommentRequest(
                      postId: widget.postId,
                      interactionType: interactionType,
                      commentText: comment,
                    );

                    debugPrint(commentToSend.toString());

                    // Aquí llamar al provider para enviarlo al backend
                    // widget.ref.read(sendCommentProvider.notifier).send(commentToSend);

                    Navigator.pop(context);
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
  }
}
