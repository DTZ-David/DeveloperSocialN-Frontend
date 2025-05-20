import 'package:devinsight/config/providers/register_provider.dart';
import 'package:devinsight/config/providers/selectedProvider.dart';
import 'package:devinsight/config/routers/app_router.dart';
import 'package:devinsight/ui/login/widgets/selectable_items_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingLanguagesPage extends ConsumerWidget {
  const OnboardingLanguagesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SelectableItemsPage(
      title: "Veamos tus intereses",
      description:
          "Escoge de 1 a 10 lenguajes, de esta manera te vamos a proveer de contenido único en tu Feed.",
      jsonAssetPath: "assets/data/languages.json",
      selectedProvider: selectedLanguagesProvider,
      iconMap: const {
        "python": FontAwesomeIcons.python,
        "java": FontAwesomeIcons.java,
        "rust": FontAwesomeIcons.rust,
        "c#": FontAwesomeIcons.c,
        "html": FontAwesomeIcons.html5,
        "css": FontAwesomeIcons.css3Alt,
        "javascript": FontAwesomeIcons.js,
        "c++": FontAwesomeIcons.code,
        "go": FontAwesomeIcons.golang,
        "c": FontAwesomeIcons.c,
        "php": FontAwesomeIcons.php,
        "ruby": FontAwesomeIcons.gem,
        "swift": FontAwesomeIcons.swift,
        "kotlin": FontAwesomeIcons.korvue,
        "dart": FontAwesomeIcons.d,
        "typescript": FontAwesomeIcons.fileCode,
        "scala": FontAwesomeIcons.scribd,
        "shell": FontAwesomeIcons.terminal,
        "r": FontAwesomeIcons.rProject,
        "perl": FontAwesomeIcons.peace,
        "lua": FontAwesomeIcons.moon,
        "haskell": FontAwesomeIcons.hackerrank,
        "elixir": FontAwesomeIcons.flask,
        "erlang": FontAwesomeIcons.codeBranch,
        "objective-c": FontAwesomeIcons.apple,
        "visual basic .net": FontAwesomeIcons.codeBranch,
      },
      backRoute: "/onboard1",
      nextRoute: "/onboard3",
      onContinue: (selectedItems) {
        // Guardar en registerProvider
        ref
            .read(registerProvider.notifier)
            .setProgrammingLanguages(selectedItems.toList());

        // Continuar a la siguiente página
        ref.read(appRouterProvider).go('/onboard3');
      },
    );
  }
}
