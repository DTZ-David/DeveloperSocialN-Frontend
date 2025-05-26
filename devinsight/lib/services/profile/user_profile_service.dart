// user_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../config/constants/app.dart';

class UserProfileService {
  Future<void> updateUsername(String token, String username) async {
    final url = Uri.parse('${AppConfig.baseUrl}/usersocialinfo/updateusername');

    final response = await http.put(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'username': username}),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al actualizar el nombre de usuario: ${response.body}');
    }
  }

  Future<void> updateProfilePicture(String token, String base64Image) async {
    final url = Uri.parse('${AppConfig.baseUrl}/usersocialinfo/updateprofilepic');

    final response = await http.put(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'profilePicture': base64Image}),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al actualizar la foto de perfil: ${response.body}');
    }
  }
}
