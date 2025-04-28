import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/widgets_login.dart';
import '../../../config/providers/auth_provider.dart';
import '../../../config/routers/app_router.dart';
import '../../../repositories/auth_repository.dart';
import '../../../services/login/auth_service.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  // Instancias fuera del método para no recrearlas siempre
  static final AuthService _authService = AuthService();
  static final AuthRepository _authRepository = AuthRepository(_authService);

  void _showErrorSnackBar(BuildContext context, String message) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.clearSnackBars();
    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<void> _login(BuildContext context, WidgetRef ref, String username, String password) async {
    try {
      final (user, token) = await _authRepository.login(username, password);

      print('Token recibido: $token');
      print('Usuario: ${user.username}');
      print('Foto de perfil: ${user.profilePicture}');
      print('Biografía: ${user.bio}');

      ref.read(authProvider.notifier).setUser(user);
      ref.read(authProvider.notifier).setToken(token);

      ref.read(appRouterProvider).go(AppRouter.initial);
    } catch (e) {
      print('Error de conexión: $e');
      _showErrorSnackBar(context, 'Error: No se pudo iniciar sesión');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController userController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 20, 6, 48), Color.fromARGB(255, 4, 1, 9)],
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/saturn.svg',
                                  height: 210,
                                  width: 210,
                                  color: const Color(0xFF1ABCFE),
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  "DevInsight",
                                  style: TextStyle(
                                    color: Color(0xFF1ABCFE),
                                    fontSize: 32,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomTextField(
                                label: "Usuario",
                                icon: Icons.person,
                                controller: userController,
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                label: "Contraseña",
                                icon: Icons.lock,
                                isPassword: true,
                                controller: passwordController,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "¿Olvidaste tu contraseña?",
                                    style: TextStyle(
                                        color: Color(0xFF1ABCFE),
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              CustomButton(
                                text: "Iniciar Sesión",
                                onPressed: () async {
                                  await ProgressDialog.show(context);
                                  final String username = userController.text;
                                  final String password = passwordController.text;
                                  await _login(context, ref, username, password);
                                },
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  ref.read(appRouterProvider).go(AppRouter.registerUser);
                                },
                                child: const Text(
                                  "Crear una cuenta",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
