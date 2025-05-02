import 'package:devinsight/config/providers/selectedProvider.dart';
import 'package:devinsight/ui/login/widgets/selectable_items_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class OnboardingToolsPage extends StatelessWidget {
  const OnboardingToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
