// create_post_view.dart
import 'dart:io';
import 'package:devinsight/config/providers/post_state.dart';
import 'package:devinsight/ui/home/widgets/tags_list.dart';
import 'package:devinsight/ui/login/widgets/customNotificationIcon.dart';
import 'package:devinsight/ui/login/widgets/customSettingsIcon.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devinsight/ui/home/widgets/post_toolbar.dart';
import 'package:devinsight/ui/home/widgets/post_textfield.dart';
import 'package:devinsight/ui/login/widgets/customButton.dart';
import 'package:flutter_svg/svg.dart';

class CreatePostView extends ConsumerWidget {
  const CreatePostView({super.key});

  Future<void> _attachFile(WidgetRef ref, {bool isImage = false}) async {
    final result = await FilePicker.platform.pickFiles(
      type: isImage ? FileType.image : FileType.any,
    );
    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      isImage
          ? ref.read(postProvider.notifier).addImage(file)
          : ref.read(postProvider.notifier).addFile(file);
    }
  }

  void _sendPost(WidgetRef ref) {
    final post = ref.read(postProvider);
    final postJson = {
      "content": post.content,
      "images": post.images.map((f) => f.path).toList(),
      "files": post.files.map((f) => f.path).toList(),
      "tags": post.tags,
      "createdAt": DateTime.now().toIso8601String(),
    };
    print("Post enviado: $postJson");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = ref.watch(postProvider);
    final charCount = post.content.length;

    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.tertiaryColors,
        elevation: 0.2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        backgroundColor: Colors.black,
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/saturn.svg',
              width: 40,
              height: 40,
              colorFilter: const ColorFilter.mode(
                AppColors.tertiaryColors,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "Devinsight",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: const [
          //Icono de notificación
          CustomNotificationIcon(),
          //Icono de configuración
          Customsettingsicon(),
        ],
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            PostToolbar(
              onImageAttach: () => _attachFile(ref, isImage: true),
              onFileAttach: () => _attachFile(ref),
              charCount: charCount,
              maxChars: 200,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Contenido de tu post:",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                const SizedBox(width: 8),
                Text('$charCount/200',
                    style: TextStyle(
                      color: charCount >= 200 ? Colors.red : Colors.grey,
                      fontSize: 12,
                    )),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PostTextField(
                      controller: TextEditingController(text: post.content),
                      maxLength: 200,
                      onChanged: (val) =>
                          ref.read(postProvider.notifier).updateContent(val),
                    ),
                    TagList(
                      tags: post.tags,
                      onTagAdded: (newTag) {
                        ref.read(postProvider.notifier).addTag(newTag);
                      },
                    ),
                    const SizedBox(height: 12),
                    if (post.images.isNotEmpty) ...[
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Imágenes:',
                            style: TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: post.images.map((img) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  img,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: GestureDetector(
                                  onTap: () => ref
                                      .read(postProvider.notifier)
                                      .removeImage(img),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      size: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                    const SizedBox(height: 16),
                    if (post.files.isNotEmpty) ...[
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Archivos:',
                            style: TextStyle(color: Colors.white)),
                      ),
                      Column(
                        children: post.files.map((file) {
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(file.path.split('/').last,
                                style: const TextStyle(color: Colors.white)),
                            trailing: IconButton(
                              icon: const Icon(Icons.close, color: Colors.red),
                              onPressed: () => ref
                                  .read(postProvider.notifier)
                                  .removeFile(file),
                            ),
                          );
                        }).toList(),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: CustomButton(
          text: "Enviar post",
          onPressed: () => _sendPost(ref),
        ),
      ),
    );
  }
}
