import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/publication/post_request.dart';

class PostService {
  Future<void> createPost(String token, PostRequest post) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.53:5120/es/api/userposts/createpost'),
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
