import 'package:devinsight/config/providers/selectedProvider.dart';
import 'package:devinsight/config/providers/toolsProvider.dart';
import 'package:devinsight/config/routers/app_router.dart';
import 'package:devinsight/ui/login/widgets/customChoiceChip.dart';

import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:devinsight/ui/login/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../config/providers/register_provider.dart';
import '../../../services/login/auth_service.dart'; // Agrega tu toolsProvider

class OnboardingPage3 extends ConsumerWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSet = ref.watch(selectedTechProvider);
    final toolsAsyncValue = ref.watch(toolsProvider);

    // Manejo del estado cargado del JSON
    return toolsAsyncValue.when(
      data: (toolsData) {
      
        Map<String, IconData> iconsMap = {
          "code": FontAwesomeIcons.code,
          "paintBrush": FontAwesomeIcons.paintBrush,
          "fileCode": FontAwesomeIcons.fileCode,
          "brain": FontAwesomeIcons.brain,
          "python": FontAwesomeIcons.python,
          "envelopeOpenText": FontAwesomeIcons.envelopeOpenText,
          "gitAlt": FontAwesomeIcons.gitAlt,
          "docker": FontAwesomeIcons.docker,
          "bookOpen": FontAwesomeIcons.bookOpen,
          "slack": FontAwesomeIcons.slack,
          "tasks": FontAwesomeIcons.tasks,
        };

        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 17, 6, 48),
                  Color.fromARGB(255, 4, 1, 9),
                ],
              ),
            ),
            child: Column(
              children: [
                // AppBar personalizado (no modificado)
                Container(
                  padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color.fromARGB(255, 17, 6, 48).withOpacity(0.1),
                        const Color.fromARGB(255, 4, 1, 9).withOpacity(0.1),
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          ref.read(appRouterProvider).go(AppRouter.onboard2);
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          ref.read(appRouterProvider).go(AppRouter.initial);
                        },
                        child: const Text(
                          "Saltar",
                          style: TextStyle(
                              color: AppColors.tertiaryColors, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Veamos tus intereses",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Escoge de 1 a 10 herramientas, de esta manera te vamos a proveer de contenido único en tu Feed.",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                // Barra de búsqueda (opcional funcional)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        hintText: "Buscar",
                        hintStyle: TextStyle(color: Colors.white70),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Lista de herramientas dinámicamente
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: toolsData.tools.map((toolData) {
                          final toolName = toolData.name;
                          final toolIconKey = toolData.icon;
                          final isSelected = selectedSet.contains(toolName);

                          return CustomChoiceChip(
                            label: toolName, // Nombre de la herramienta
                            isSelected: isSelected, // Si está seleccionado o no
                            icon: iconsMap[toolIconKey] ??
                                Icons.build, // Si no hay ícono, usar uno por defecto
                            onSelected: () {
                              final notifier =
                                  ref.read(selectedTechProvider.notifier);
                              notifier
                                  .toggle(toolName); // Cambiar el estado del chip
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                // Botón continuar (no modificado)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: CustomButton(
                    text: "continuar",
                    onPressed: () async {
                      final selectedLanguages = ref.read(selectedTechProvider);
                      final registerNotifier = ref.read(registerProvider.notifier);

                      registerNotifier
                          .setProgrammingLanguages(selectedLanguages.toList());

                      final registerState = ref.read(registerProvider);

                      final authService = AuthService();

                      try {
                        await authService.register(
                          username: registerState.username,
                          email: registerState.email,
                          password: registerState.password,
                          bio: registerState.bio,
                          profilePicture: registerState.profilePicture,
                          programmingLanguages: registerState.programmingLanguages,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Registro exitoso 🎉'),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 2),
                          ),
                        );

                        await Future.delayed(const Duration(seconds: 2));

                        ref.read(appRouterProvider).go(AppRouter.initial);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error en el registro: $e')),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}

