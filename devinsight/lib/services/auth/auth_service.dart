import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String _baseUrl =
      'https://tu-api.com/auth/login'; // Cambia la URL según tu API

  static Future<Map<String, dynamic>> login(
      String username, String password) async {
    final url = Uri.parse(_baseUrl);

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": username,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        return {"success": true, "data": jsonDecode(response.body)};
      } else {
        final responseData = jsonDecode(response.body);
        return {
          "success": false,
          "message": responseData["message"] ?? "Error al iniciar sesión"
        };
      }
    } catch (e) {
      return {
        "success": false,
        "message": "No se pudo conectar con el servidor"
      };
    }
  }
}
