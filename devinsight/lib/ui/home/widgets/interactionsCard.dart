import 'package:devinsight/ui/home/widgets/optionsDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InteractionCard extends StatelessWidget {
  final String tipo;
  final String id;
  final String mensaje;

  const InteractionCard({
    super.key,
    required this.tipo,
    required this.id,
    required this.mensaje,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    Widget iconWidget;

    switch (tipo.toLowerCase()) {
      case 'mejora':
        color = Colors.amber;
        iconWidget = SvgPicture.asset(
          'assets/icons/careful.svg',
          width: 20,
          height: 20,
          color: color,
        );
        break;
      case 'comentarios':
        color = Colors.lightBlue;
        iconWidget = SvgPicture.asset(
          'assets/icons/comments.svg',
          width: 20,
          height: 20,
          color: color,
        );
        break;
      case 'confirmacion':
        color = Colors.green;
        iconWidget = SvgPicture.asset(
          'assets/icons/verified.svg',
          width: 20,
          height: 20,
          color: color,
        );
        break;
      default:
        color = Colors.grey;
        iconWidget = Icon(Icons.info, color: color, size: 20);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: Card(
        color: Colors.black,
        margin: EdgeInsets.zero,
        elevation: 2,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  iconWidget,
                  const SizedBox(width: 8),
                  Text(
                    tipo,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '#$id',
                    style: const TextStyle(
                      color: Colors.blueAccent,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => const OptionsDialog());
                    },
                    child: const Icon(Icons.more_vert,
                        size: 20, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(mensaje,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
