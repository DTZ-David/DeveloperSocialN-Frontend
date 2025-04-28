import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final String _baseUrl = 'http://192.168.1.53:5120/es/api/user';

  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse('$_baseUrl/loginapp');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception('Error en login: ${response.statusCode}');
    }
  }

  Future<void> register({
    required String username,
    required String email,
    required String password,
    required String bio,
    required String profilePicture,
    required List<String> programmingLanguages,
  }) async {
    final url = Uri.parse('$_baseUrl/registeruser');

    final body = {
      "email": email,
      "userName": username,
      "password": password,
      "bio": bio,
      "profilePicture": profilePicture,
      "preferences": {
        "programmingLanguages": programmingLanguages,
      }
    };

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    if (response.statusCode != 201) {
      throw Exception('Error en registro: ${response.statusCode}');
    }
  }
}
