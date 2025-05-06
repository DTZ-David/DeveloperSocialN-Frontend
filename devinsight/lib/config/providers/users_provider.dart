import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;

final usersProvider = FutureProvider<List<User>>((ref) async {
  final String response = await rootBundle.loadString('assets/data/users.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => User.fromJson(json)).toList();
});

final userByIdProvider =
    FutureProvider.family<User, String>((ref, userId) async {
  final allUsers = await ref.watch(usersProvider.future);
  return allUsers.firstWhere((u) => u.id == userId);
});

class User {
  final String id;
  final String name;
  final String description;
  final String profilePicture;

  User(
      {required this.id,
      required this.name,
      required this.description,
      required this.profilePicture});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(), // Asegura que sea String
      name: json['name'],
      description: json['description'],
      profilePicture: json['profile_pic'], // <- corregido
    );
  }
}
