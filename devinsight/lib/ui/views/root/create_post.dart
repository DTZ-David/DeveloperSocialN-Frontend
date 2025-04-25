import 'package:devinsight/ui/widgets/auth/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePostView extends ConsumerWidget {
  const CreatePostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Crear un Post',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.image),
                  onPressed: () {
                    // Handle image attachment
                    print("Image attached!");
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.attach_file),
                  onPressed: () {
                    // Handle file attachment
                    print("File attached!");
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.tag),
                  onPressed: () {
                    // Handle adding tags
                    print("Tags added!");
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            const TextField(
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Escribe tu contenido del Post aqui...',
                labelText: 'Contenido',
              ),
            ),
            const SizedBox(height: 16),
            CustomButton(
                text: "Enviar post",
                onPressed: () {
                  // Handle image attachment
                  print("Post sent!");
                })
          ],
        ),
      ),
    );
  }
}
