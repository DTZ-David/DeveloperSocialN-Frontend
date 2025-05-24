import 'package:devinsight/config/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSettingsIcon extends ConsumerWidget {
  const CustomSettingsIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: SvgPicture.asset(
        'assets/icons/settings.svg',
        color: Colors.white,
        width: 24,
        height: 24,
      ),
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return Dialog(
              backgroundColor: const Color(0xFF1F2228),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Cerrar sesión",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "¿Estás seguro que deseas cerrar sesión?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white70,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Cancelar"),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4F8FFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                          ),
                          icon: const Icon(Icons.logout_outlined, size: 18),
                          label: const Text(
                            "Cerrar sesión",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(); // cerrar diálogo
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: const Color(0xFF23262B),
                                content: const Text(
                                  'Se ha cerrado sesión',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                  ),
                                ),
                                action: SnackBarAction(
                                  label: 'Ocultar',
                                  textColor: Colors.white,
                                  onPressed: () {},
                                ),
                              ),
                            );

                            ref.read(appRouterProvider).go(AppRouter.login);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
