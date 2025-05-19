import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:devinsight/models/publication/comment.dart';

import '../../config/constants/app.dart';

class CommentService {
  Future<List<Comment>> getCommentsByPostId(String postId, String token) async {
    final url = Uri.parse('${AppConfig.baseUrl}/userposts/getcommentbypostid?postId=$postId');

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);

      final List<dynamic> data = decoded['data'];
      return data.map((e) => Comment.fromJson(e)).toList();
    } else {
      throw Exception('Error al obtener comentarios');
    }
  }

  Future<List<Comment>> getUserInteractions(String token) async {
    final url = Uri.parse('${AppConfig.baseUrl}/userposts/getuserinteraction');

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List<dynamic> data = decoded['data'];
      return data.map((e) => Comment.fromJson(e)).toList();
    } else {
      throw Exception('Error al obtener interacciones del usuario');
    }
  }
}
