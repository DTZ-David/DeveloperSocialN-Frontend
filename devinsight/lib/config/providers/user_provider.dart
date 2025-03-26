import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/user/user.dart';
import '../../services/devinsight/storage_service.dart';
import '../constants/app.dart';

final userProvider = StateProvider<User?>((ref) {
  return null;
});

final userInitialProvider = FutureProvider<void>((ref) async {
  final data = await StorageService().read(AppConfig.userData);
  if (data == null) return;
  final userData = jsonDecode(data);
  ref.read(userProvider.notifier).state = User.fromJson(userData);
});
