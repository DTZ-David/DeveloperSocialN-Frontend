import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../config/constants/app.dart';
import '../../models/publication/post_request.dart';

class PostService {
  Future<void> createPost(String token, PostRequest post) async {
    final response = await http.post(
      Uri.parse('${AppConfig.baseUrl}/userposts/createpost'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(post.toJson()),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Error al crear post: ${response.body}');
    }
  }
}
