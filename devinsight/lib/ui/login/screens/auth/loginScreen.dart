import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../config/routers/app_router.dart';
import '../../widgets/customButton.dart';
import '../../widgets/customTextField.dart';
import '../../../../services/auth/auth_service.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    final String user = _userController.text.trim();
    final String password = _passwordController.text.trim();

    if (user.isEmpty || password.isEmpty) {
      _showSnackbar("Por favor, llena todos los campos", Colors.red);
      return;
    }

    setState(() => _isLoading = true);

    final response = await AuthService.login(user, password);

    if (response["success"]) {
      _showSnackbar("Inicio de sesión exitoso 🎉", Colors.green);
      // Aquí podrías guardar el token de sesión si tu API lo devuelve
    } else {
      _showSnackbar(response["message"], Colors.red);
    }

    setState(() => _isLoading = false);
  }

  void _showSnackbar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 20, 6, 48),
                Color.fromARGB(255, 4, 1, 9)
              ],
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
                                  height: 240,
                                  width: 240,
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomTextField(
                                label: "Usuario",
                                icon: Icons.person,
                                controller: _userController,
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                label: "Contraseña",
                                icon: Icons.lock,
                                isPassword: true,
                                controller: _passwordController,
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
                                text: _isLoading
                                    ? "Cargando..."
                                    : "Iniciar Sesión",
                                onPressed: _isLoading ? null : _login,
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  ref
                                      .read(appRouterProvider)
                                      .go(AppRouter.registerUser);
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
