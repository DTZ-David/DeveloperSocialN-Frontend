import 'dart:convert';
import 'package:devinsight/models/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;

final usersProvider = FutureProvider<List<User>>((ref) async {
  final String response = await rootBundle.loadString('assets/data/users.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => User.fromJson(json)).toList();
});

final userByIdProvider = FutureProvider.family<User, int>((ref, userId) async {
  final allUsers = await ref.watch(usersProvider.future);
  return allUsers.firstWhere((u) => u.id == userId);
});
