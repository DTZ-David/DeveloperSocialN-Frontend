import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/publication/post.dart';

class FeedService {
  Future<List<Post>> fetchFeed(String token) async {
    final response = await http.get(
      Uri.parse('http://192.168.1.53:5120/es/api/userposts/getfeed'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);

      // Accede a la clave 'data' que contiene la lista de publicaciones
      final List<dynamic> data = decoded['data'];
      return data.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Error al cargar el feed: ${response.statusCode}');
    }
  }
}
