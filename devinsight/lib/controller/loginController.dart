// login_controller.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../config/providers/auth_provider.dart';
import '../../../repositories/auth_repository.dart';
import '../../../services/login/auth_service.dart';

final loginControllerProvider = Provider<LoginController>((ref) {
  final authRepository = AuthRepository(AuthService());
  return LoginController(ref, authRepository);
});

class LoginController {
  final Ref ref;
  final AuthRepository _authRepository;

  LoginController(this.ref, this._authRepository);

  Future<bool> login(String username, String password) async {
    try {
      final (user, token) = await _authRepository.login(username, password);
      ref.read(authProvider.notifier).setUser(user);
      ref.read(authProvider.notifier).setToken(token);
      return true;
    } catch (e) {
      print('Error de login: $e');
      return false;
    }
  }
}
