import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/user/user_dto.dart';

class UserService {
  Future<UserDto> searchUserByUsername(String username) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.53:5120/es/api/usersocialinfo/getuserbyusername'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UserDto.fromJson(data['data']);
    } else {
      throw Exception('Error al buscar usuario');
    }
  }
}
