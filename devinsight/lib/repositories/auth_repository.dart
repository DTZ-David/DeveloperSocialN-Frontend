import 'package:devinsight/models/user/user.dart';
import 'package:devinsight/services/login/auth_service.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);

  Future<(User, String)> login(String username, String password) async {
    final response = await _authService.login(username, password);

    if (response['isSuccess'] == true) {
      final String token = response['data']['token'];
      final user = User(id: 0, name: '', email: '');
      return (user, token);
    } else {
      throw Exception('Login fallido');
    }
  }
}
