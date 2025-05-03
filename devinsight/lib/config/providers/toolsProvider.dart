import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/models/tool.dart';


final toolsProvider = FutureProvider<Tools>((ref) async {
  
  final String response = await rootBundle.loadString('assets/data/tools.json');
  final List<dynamic> data = json.decode(response);

  
  return Tools.fromJson(data);
});


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
