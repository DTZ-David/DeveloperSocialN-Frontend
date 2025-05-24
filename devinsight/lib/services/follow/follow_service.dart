import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../config/constants/app.dart';

class FollowService {
  Future<void> followUser(String token, String followerEmail) async {
    final response = await http.put(
      Uri.parse('${AppConfig.baseUrl}/usersocialinfo/follow'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'followerEmail': followerEmail}),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al seguir usuario: ${response.statusCode}');
    }
  }
}
