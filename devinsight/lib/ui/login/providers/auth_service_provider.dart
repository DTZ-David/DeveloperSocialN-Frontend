import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../services/login/auth_service.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());
