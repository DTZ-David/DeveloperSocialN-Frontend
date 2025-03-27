import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../config/routers/app_router.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';
import '../widgets/socialButton.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.grey.shade800, Colors.black],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.code, color: Colors.green, size: 80),
                const SizedBox(height: 10),
                const Text(
                  "DevInsight",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),

                // Campos de texto reutilizables
                const CustomTextField(label: "Usuario", icon: Icons.person),
                const SizedBox(height: 20),
                const CustomTextField(label: "Correo", icon: Icons.email),
                const SizedBox(height: 20),
                const CustomTextField(label: "Contraseña", icon: Icons.lock, isPassword: true),

                const SizedBox(height: 20),

                // Botón de Crear Cuenta
                CustomButton(
                  text: "Crear Cuenta",
                  onPressed: () {
                    print("Crear Cuenta presionado");
                  },
                ),

                const SizedBox(height: 20),

                const SizedBox(height: 20),

                // Texto Iniciar Sesión
                GestureDetector(
                  onTap: () {
                    ref.read(appRouterProvider).go(AppRouter.login);
                  },
                  child: const Text(
                    "Iniciar Sesión",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
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
