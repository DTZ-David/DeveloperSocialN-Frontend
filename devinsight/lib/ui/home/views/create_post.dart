import 'dart:io';
import 'package:devinsight/ui/home/widgets/post_file_list.dart';
import 'package:devinsight/ui/home/widgets/post_image_gallery.dart';
import 'package:devinsight/ui/home/widgets/tags_list.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devinsight/ui/home/widgets/post_textfield.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/providers/post_provider.dart';
import '../../../controller/postRequestController.dart';
import '../../../models/publication/post_request.dart';

Future<String> readFileContent(File file) async {
  return await file.readAsString();
}

class CreatePostView extends ConsumerStatefulWidget {
  const CreatePostView({super.key});

  @override
  ConsumerState<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends ConsumerState<CreatePostView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static const _snackBarStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const _dialogTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    color: Colors.white70,
  );

  Future<void> _attachFile(WidgetRef ref, {bool isImage = false}) async {
    final result = await FilePicker.platform.pickFiles(
      type: isImage ? FileType.image : FileType.any,
    );
    if (result?.files.single.path != null) {
      final file = File(result!.files.single.path!);
      final notifier = ref.read(postProvider.notifier);
      if (isImage) {
        notifier.addImage(file);
      } else {
        final code = await file.readAsString();
        notifier.setCodeSnippet(code);
        notifier.addFile(file);
      }
    }
  }

  void _sendPost(BuildContext context, WidgetRef ref) async {
    final post = ref.read(postProvider);
    if (post.content.isEmpty && post.files.isEmpty) {
      _showSnackBar(context, "El contenido o archivo no puede estar vacío");
      return;
    }

    String code = post.codeSnippet;

    if (code.isEmpty && post.files.isNotEmpty) {
      code = await readFileContent(post.files.first);
    }

    final postRequest = PostRequest(
      codeLanguage: post.codeLanguage,
      codeSnippet: code,
      description: post.content,
      tags: post.tags,
    );

    await ref.read(postControllerProvider.notifier).createPost(postRequest);

    ref.read(postProvider.notifier).clear();
    _controller.clear();
    _showSnackBar(context, "¡Post creado con éxito!");
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: _snackBarStyle),
        backgroundColor: const Color.fromARGB(255, 24, 24, 24),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }

  void _showConfirmationDialog(
    BuildContext context, {
    required String title,
    required String content,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 24, 24, 24),
        title: Center(child: Text(title, style: _snackBarStyle)),
        content: Text(content, style: _dialogTextStyle),
        actions: [
          _dialogButton(
            label: 'Cancelar',
            color: Colors.redAccent,
            onPressed: () => Navigator.of(context).pop(),
          ),
          _dialogButton(
            label: 'Enviar',
            color: Colors.white,
            onPressed: onConfirm,
          ),
        ],
      ),
    );
  }

  TextButton _dialogButton({
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final post = ref.watch(postProvider);
    final charCount = post.content.length;

    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: const Color.fromARGB(255, 21, 20, 20),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildCharacterCounter(charCount),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PostTextField(
                      maxLength: 400,
                      controller: _controller,
                      onChanged: (val) => ref.read(postProvider.notifier).updateContent(val),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    PostImageGallery(images: post.images),
                    PostFileList(files: post.files),
                    TagList(
                      tags: post.tags,
                      onTagAdded: ref.read(postProvider.notifier).addTag,
                      onTagRemoved: ref.read(postProvider.notifier).removeTag,
                    ),
                    TextFormField(
                      initialValue: post.codeLanguage,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Lenguaje de programación',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      onChanged: (value) => ref.read(postProvider.notifier).setCodeLanguage(value),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: const BorderSide(color: Colors.white, width: 1),
        ),
        elevation: 1,
        onPressed: () => _sendPost(context, ref),
        backgroundColor: Colors.black,
        child: const Icon(Icons.send, color: Colors.white, size: 28),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      shadowColor: AppColors.tertiaryColors,
      elevation: 0.2,
      backgroundColor: AppColors.primaryColors,
      title: const Row(
        children: [
          SizedBox(width: 16),
          Text(
            "Crear Post",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/image.svg',
            color: Colors.white,
            width: 20,
            height: 20,
          ),
          onPressed: () => _attachFile(ref, isImage: true),
        ),
        IconButton(
          icon: const Icon(Icons.attach_file, size: 20, color: Colors.white),
          onPressed: () => _attachFile(ref),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildCharacterCounter(int charCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Caracteres:",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '$charCount/400',
          style: TextStyle(
            color: charCount >= 400 ? Colors.red : Colors.grey,
            fontSize: 12,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
