import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devinsight/models/user/user.dart';

class AuthState {
  final User user;
  final String token;

  AuthState({
    required this.user,
    required this.token,
  });
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState(user: const User(id: "0"), token: ''));

  void setUser(User user) {
    state = AuthState(user: user, token: state.token);
  }

  void setToken(String token) {
    state = AuthState(user: state.user, token: token);
  }

  void clear() {
    state = AuthState(user: const User(id: "0"), token: '');
  }
}

// Definir el provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(),
);
