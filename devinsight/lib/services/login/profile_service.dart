import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

Future<String?> uploadImageToSupabase(XFile file) async {
  final supabase = Supabase.instance.client;
  final fileBytes = await file.readAsBytes();
  final fileExt = extension(file.path);
  final fileName = '${DateTime.now().millisecondsSinceEpoch}$fileExt';
  final mimeType = lookupMimeType(file.path);
  final filePath = 'avatars/$fileName';

  try {
    await supabase.storage.from('profiles').uploadBinary(
          filePath,
          fileBytes,
          fileOptions: FileOptions(contentType: mimeType ?? 'image/jpeg'),
        );

    // Obtener URL pública
    final publicUrl = supabase.storage.from('profiles').getPublicUrl(filePath);
    return publicUrl;
  } catch (e) {
    print('Error uploading image: $e');
    return null;
  }
}
