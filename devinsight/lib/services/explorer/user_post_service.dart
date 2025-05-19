// services/user/user_post_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../config/constants/app.dart';
import '../../../models/publication/post.dart';

class UserPostService {
  Future<List<Post>> fetchUserPosts(String email, String token) async {
    final response = await http.post(
      Uri.parse('${AppConfig.baseUrl}/usersocialinfo/getuserpostbyemail'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'email': email}),
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List<dynamic> data = decoded['data'];
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar los posts del usuario: ${response.body}');
    }
  }
}
