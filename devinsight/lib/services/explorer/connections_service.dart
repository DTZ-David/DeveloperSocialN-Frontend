import 'package:devinsight/models/user/user_dto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../config/constants/app.dart';
import '../../models/user/user.dart';

class ConnectionsService {
  Future<List<UserDto>> fetchConnections(String token) async {
    final response = await http.get(
      Uri.parse('${AppConfig.baseUrl}/usersocialinfo/getconnections'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List<dynamic> data = decoded['data'];
      return data.map((e) => UserDto.fromJson(e)).toList();
    } else {
      throw Exception('Error al obtener conexiones: ${response.statusCode}');
    }
  }
}
