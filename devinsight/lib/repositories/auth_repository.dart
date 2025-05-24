import '../models/user/user.dart';
import '../services/login/auth_service.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);

  Future<(User, String)> login(String username, String password) async {
    final response = await _authService.login(username, password);

    if (response['isSuccess'] == true) {
      final String token = response['data']['token'];
      final user = User(
          id: '', // Si tienes un campo 'id' en la respuesta, úsalo aquí
          userName: response['data']['username'],
          email: username, // Usando el email que pasaste al login
          profilePicture: response['data']['profilePicture'],
          bio: response['data']['bio'],
          postsCount: response['data']['postsCount'], // Número de publicaciones
          followersCount: response['data']['followersCount'],
          currentFollow: response['data']['currentFollow'] // Número de seguidores
          );
      return (user, token);
    } else {
      throw Exception('Login fallido');
    }
  }
}
