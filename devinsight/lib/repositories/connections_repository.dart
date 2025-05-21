import '../models/user/user_dto.dart';
import '../services/explorer/connections_service.dart';

class ConnectionsRepository {
  final ConnectionsService _service;

  ConnectionsRepository(this._service);

  Future<List<UserDto>> getConnections(String token) async {
    return await _service.fetchConnections(token);
  }
}
