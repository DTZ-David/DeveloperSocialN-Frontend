import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/models/tool.dart';

// Provider para cargar las herramientas
final toolsProvider = FutureProvider<Tools>((ref) async {
  // Cargar el archivo JSON desde assets
  final String response = await rootBundle.loadString('assets/data/tools.json');
  final List<dynamic> data = json.decode(response);

  // Convertir el JSON a una lista de herramientas
  return Tools.fromJson(data);
});

// Modelo de las herramientas
class Tools {
  final List<Tool> tools;

  Tools({required this.tools});

  factory Tools.fromJson(List<dynamic> json) {
    List<Tool> toolsList = [];
    for (var tool in json) {
      toolsList.add(Tool.fromJson(tool));
    }
    return Tools(tools: toolsList);
  }
}
