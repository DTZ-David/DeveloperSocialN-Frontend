import 'package:flutter_riverpod/flutter_riverpod.dart';

final interactionsProvider = Provider<List<Map<String, dynamic>>>((ref) {
  return [
    {
      'tipo': 'comentarios',
      'id': '001',
      'mensaje': 'Buen trabajo, deberías agregar un loader.',
    },
    {
      'tipo': 'mejora',
      'id': '002',
      'mensaje': 'Sería bueno refactorizar este componente.',
    },
    {
      'tipo': 'confirmacion',
      'id': '003',
      'mensaje': 'Ya implementé los cambios sugeridos.',
    },
    {
      'tipo': 'confirmacion',
      'id': '003',
      'mensaje': 'Ya implementé los cambios sugeridos.',
    },
    {
      'tipo': 'confirmacion',
      'id': '003',
      'mensaje': 'Ya implementé los cambios sugeridos.',
    },
    {
      'tipo': 'confirmacion',
      'id': '003',
      'mensaje': 'Ya implementé los cambios sugeridos.',
    },
  ];
});
