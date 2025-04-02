import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../../../../config/routers/app_router.dart';
import '../../widgets/customButton.dart';
import '../../widgets/customTextField.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  void _showErrorSnackBar(BuildContext context, String message) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.clearSnackBars(); // Limpia cualquier SnackBar previo
    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating, // Hace que el SnackBar flote
        margin: const EdgeInsets.all(10), // Añade margen alrededor
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<void> _login(
      BuildContext context, String username, String password) async {
    try {
      print('Intentando conectar al servidor...');

      final scaffoldMessenger = ScaffoldMessenger.of(context);
      scaffoldMessenger.clearSnackBars();
      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text(
            'Conectando al servidor...',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          duration: Duration(seconds: 2),
        ),
      );

      final response = await http
          .post(
        Uri.parse('http://localhost:3000/api/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'password': password,
        }),
      )
          .timeout(
        const Duration(
            seconds: 5), // Reducido a 5 segundos para ver el error más rápido
        onTimeout: () {
          throw Exception('El servidor no respondió a tiempo');
        },
      );

      if (response.statusCode == 200) {
        print('Login exitoso: ${response.body}');
        // Aquí puedes guardar el token y navegar a la siguiente pantalla
      } else {
        print('Error del servidor: ${response.statusCode}');
        _showErrorSnackBar(context, 'Error: Credenciales inválidas');
      }
    } catch (e) {
      print('Error de conexión: $e');
      _showErrorSnackBar(context, 'Error: No se pudo conectar con el servidor');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Añadimos los controladores para los campos de texto
    final TextEditingController userController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

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
                                  controller: userController),
                              const SizedBox(height: 20),
                              CustomTextField(
                                  label: "Contraseña",
                                  icon: Icons.lock,
                                  isPassword: true,
                                  controller: passwordController),
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
                                  final String username = userController.text;
                                  final String password =
                                      passwordController.text;

                                  await _login(context, username, password);
                                },
                              ),
                              const SizedBox(height: 20),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     Expanded(
                              //       child: SocialButton(
                              //         icon: 'assets/icons/github.svg',
                              //         onPressed: () => print("GitHub"),
                              //       ),
                              //     ),
                              //     const SizedBox(width: 20),
                              //     Expanded(
                              //       child: SocialButton(
                              //         icon: 'assets/icons/google.svg',
                              //         onPressed: () => print("Google"),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              const SizedBox(height: 10),
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
