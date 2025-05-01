import 'package:flutter_riverpod/flutter_riverpod.dart';

final interactionsProvider = Provider<List<Map<String, dynamic>>>((ref) {
  return [
    {
      'tipo': 'comentarios',
      'id': '65352',
      'mensaje': 'Buen trabajo, deberías agregar un loader.',
    },
    {
      'tipo': 'mejora',
      'id': '64441',
      'mensaje': 'Sería bueno refactorizar este componente.',
    },
    {
      'tipo': 'comentarios',
      'id': '0143603',
      'mensaje': 'Ya implementé los cambios sugeridos.',
    },
    {
      'tipo': 'confirmacion',
      'id': '0735203',
      'mensaje': 'Ya implementé los cambios sugeridos.',
    },
    {
      'tipo': 'comentarios',
      'id': '64214',
      'mensaje': 'Ya implementé los cambios sugeridos.',
    },
    {
      'tipo': 'mejora',
      'id': '12323',
      'mensaje': 'Ya implementé los cambios sugeridos.',
    },
    {
      'tipo': 'confirmacion',
      'id': '5353',
      'mensaje': 'Ya implementé los cambios sugeridos.',
    },
    {
      'tipo': 'mejora',
      'id': '42312',
      'mensaje': 'Ya implementé los cambios sugeridos.',
    },
    {
      'tipo': 'mejora',
      'id': '123',
      'mensaje': 'Ya implementé los cambios sugeridos.',
    },
  ];
});
