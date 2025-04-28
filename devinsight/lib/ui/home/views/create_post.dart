import 'dart:io';
import 'package:devinsight/ui/widgets/tags_list.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devinsight/ui/home/widgets/post_toolbar.dart';
import 'package:devinsight/ui/home/widgets/post_textfield.dart';
import 'package:devinsight/ui/login/widgets/customButton.dart';

class CreatePostView extends ConsumerStatefulWidget {
  const CreatePostView({super.key});

  @override
  ConsumerState<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends ConsumerState<CreatePostView> {
  final TextEditingController _controller = TextEditingController();
  final int _maxChars = 200;
  int _charCount = 0;

  List<File> attachedImages = [];
  List<File> attachedFiles = [];
  List<String> tags = [];

  void _updateCharCount() {
    setState(() {
      _charCount = _controller.text.length;
    });
  }

  Future<void> _attachImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.path != null) {
      setState(() {
        attachedImages.add(File(result.files.single.path!));
      });
    }
  }

  Future<void> _attachFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.any);
    if (result != null && result.files.single.path != null) {
      setState(() {
        attachedFiles.add(File(result.files.single.path!));
      });
    }
  }

  void _removeAttachment(File file, {bool isImage = true}) {
    setState(() {
      if (isImage) {
        attachedImages.remove(file);
      } else {
        attachedFiles.remove(file);
      }
    });
  }

  void _addTag() {
    setState(() {
      tags.add("#ejemplo");
    });
  }

  void _sendPost() {
    final postJson = {
      "content": _controller.text,
      "images": attachedImages.map((f) => f.path).toList(),
      "files": attachedFiles.map((f) => f.path).toList(),
      "tags": tags,
      "createdAt": DateTime.now().toIso8601String(),
    };
    print("Post enviado: $postJson");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            PostToolbar(
              onImageAttach: _attachImage,
              onFileAttach: _attachFile,
              charCount: _charCount,
              maxChars: _maxChars,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Contenido de tu post:",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
                const SizedBox(width: 8),
                Text(
                  '$_charCount/$_maxChars',
                  style: TextStyle(
                    color: _charCount >= _maxChars ? Colors.red : Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PostTextField(
                      controller: _controller,
                      maxLength: _maxChars,
                      onChanged: (_) => _updateCharCount(),
                    ),
                    TagList(
                      tags: tags,
                      onTagAdded: (newTag) {
                        setState(() {
                          tags.add(newTag);
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    if (attachedImages.isNotEmpty) ...[
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Imágenes:',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          spacing: 8,
                          children: attachedImages.map((img) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 2.0, vertical: 6.0),
                              child: Stack(
                                alignment: Alignment.centerLeft,
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
                                      onTap: () => _removeAttachment(img),
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
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    if (attachedFiles.isNotEmpty) ...[
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Archivos:',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 8),
                      Column(
                        children: attachedFiles.map((file) {
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(file.path.split('/').last,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500)),
                            trailing: IconButton(
                              icon: const Icon(Icons.close, color: Colors.red),
                              onPressed: () => _removeAttachment(file, isImage: false),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
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
          onPressed: _sendPost,
        ),
      ),
    );
  }
}
