import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devinsight/ui/widgets/publicationsCard.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<Map<String, dynamic>> publications = [];

  @override
  void initState() {
    super.initState();
    _loadPublications();
  }

  Future<void> _loadPublications() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/data/publications.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      setState(() {
        publications = jsonList.cast<Map<String, dynamic>>();
      });
    } catch (e) {
      debugPrint('Error cargando publicaciones: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: publications.length,
      itemBuilder: (context, index) {
        final data = publications[index];
        return Column(
          children: [
            PublicationsCard(
              title: data['title'],
              subtitle: data['subtitle'],
              iconPath: data['iconPath'],
              description: data['description'],
              code: data['code'],
              reactions: List<int>.from(data['reactions']),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
