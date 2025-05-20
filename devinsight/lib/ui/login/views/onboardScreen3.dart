//import 'package:devinsight/config/providers/register_provider.dart';
import 'package:devinsight/config/providers/register_provider.dart';
import 'package:devinsight/config/providers/selectedProvider.dart';
import 'package:devinsight/config/routers/app_router.dart';
import 'package:devinsight/services/login/auth_service.dart';
import 'package:devinsight/ui/login/widgets/selectable_items_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class OnboardingToolsPage extends ConsumerWidget {
  const OnboardingToolsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SelectableItemsPage(
      title: "Tus herramientas favoritas",
      description:
          "Selecciona las herramientas que usas regularmente para afinar aún más tu experiencia.",
      jsonAssetPath: "assets/data/tools.json",
      selectedProvider: selectedToolsProvider, // puedes usar otro provider
      iconMap: const {
        "git": FontAwesomeIcons.gitAlt,
        "docker": FontAwesomeIcons.docker,
        "vscode": FontAwesomeIcons.code,
        "figma": FontAwesomeIcons.paintbrush,
        "sublime": FontAwesomeIcons.fileCode,
        "intellij": FontAwesomeIcons.brain,
        "anaconda": FontAwesomeIcons.python,
        "postman": FontAwesomeIcons.paperPlane,
        "jupyter": FontAwesomeIcons.bookOpen,
        "slack": FontAwesomeIcons.slack,
        "trello": FontAwesomeIcons.listCheck,
        "github": FontAwesomeIcons.github,
      },
      backRoute: "/onboard2",
      nextRoute: "/main",
      onContinue: (selectedItems) async {
        // Guardar en registerProvider
        // ref
        //.read(registerProvider.notifier)
        //.setProgrammingLanguages(selectedItems.toList());

        // Continuar a la siguiente página
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

          ref.read(appRouterProvider).go('/onboard3');
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error en el registro: $e')),
          );
        }
      },
    );
  }
}
