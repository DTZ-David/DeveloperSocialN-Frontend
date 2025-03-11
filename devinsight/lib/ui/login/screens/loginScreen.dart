import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';
import '../widgets/socialButton.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
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
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Icon(Icons.code, color: Color(0xFF1ABCFE), size: 100),
                SvgPicture.asset(
                  'assets/icons/saturn.svg',
                  height: 100,
                  width: 100,
                  // ignore: deprecated_member_use
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
                const SizedBox(height: 30),
                const CustomTextField(label: "Usuario", icon: Icons.person),
                const SizedBox(height: 20),
                const CustomTextField(
                    label: "Contraseña", icon: Icons.lock, isPassword: true),
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
                  onPressed: () {
                    print("Iniciar Sesión presionado");
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SocialButton(
                        icon: 'assets/icons/github.svg',
                        onPressed: () => print("GitHub"),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: SocialButton(
                        icon: 'assets/icons/google.svg',
                        onPressed: () => print("Google"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => print("Crear una cuenta"),
                  child: const Text(
                    "Crear una cuenta",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
