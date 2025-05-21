import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../repositories/connections_repository.dart';
import '../../config/providers/auth_provider.dart';
import '../../services/explorer/connections_service.dart';

final connectionsRepositoryProvider = Provider<ConnectionsRepository>((ref) {
  return ConnectionsRepository(ConnectionsService());
});

final connectionsProvider = FutureProvider.autoDispose((ref) async {
  final token = ref.watch(authProvider.select((auth) => auth.token));
  if (token.isEmpty) throw Exception('No token');

  final repo = ref.read(connectionsRepositoryProvider);
  return await repo.getConnections(token);
});
