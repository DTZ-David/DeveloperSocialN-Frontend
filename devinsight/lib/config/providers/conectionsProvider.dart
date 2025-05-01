import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectionsProvider = Provider<List<Map<String, dynamic>>>((ref) {
  return [
    {
      'title': 'Base de datos principal',
      'subtitle': 'Conexión activa desde el servidor A.',
      'iconAsset': 'assets/icons/user1.png',
    },
    {
      'title': 'API de autenticación',
      'subtitle': 'Última respuesta hace 2 horas.',
      'iconAsset': 'assets/icons/user2.png',
    },
    {
      'title': 'Servidor de correo',
      'subtitle': 'Sincronizado correctamente.',
      'iconAsset': 'assets/icons/user3.png',
    },
    {
      'title': 'Servidor de backup',
      'subtitle': 'Última copia: hoy a las 03:00 AM.',
      'iconAsset': 'assets/icons/user4.png',
    },
  ];
});
