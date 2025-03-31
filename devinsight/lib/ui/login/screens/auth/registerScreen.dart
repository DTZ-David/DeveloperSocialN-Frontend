import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../config/routers/app_router.dart';
import '../../../../services/auth/auth_service.dart';
import '../../widgets/customButton.dart';
import '../../widgets/customTextField.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _register() async {
    final String user = _userController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (user.isEmpty || email.isEmpty || password.isEmpty) {
      _showSnackbar("Por favor, llena todos los campos", Colors.red);
      return;
    }

    setState(() => _isLoading = true);

    /*
    final response = await AuthService.register(user, email, password);

    if (response["success"]) {
      _showSnackbar("Registro exitoso 🎉", Colors.green);
      ref.read(appRouterProvider).go(AppRouter.onboard1);
    } else {
      _showSnackbar(response["message"], Colors.red);
    }
    */
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
                Color.fromARGB(255, 4, 1, 9),
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
                                label: "Correo",
                                icon: Icons.email,
                                controller: _emailController,
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                label: "Contraseña",
                                icon: Icons.lock,
                                isPassword: true,
                                controller: _passwordController,
                              ),
                              const SizedBox(height: 40),
                              CustomButton(
                                text: _isLoading
                                    ? "Registrando..."
                                    : "Registrarse",
                                onPressed: _isLoading ? null : _register,
                              ),
                              const SizedBox(height: 30),
                              GestureDetector(
                                onTap: () {
                                  ref
                                      .read(appRouterProvider)
                                      .go(AppRouter.login);
                                },
                                child: const Text(
                                  "¿Ya tienes una cuenta? Inicia sesión",
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
