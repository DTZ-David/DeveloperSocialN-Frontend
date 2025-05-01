import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectionsProvider = Provider<List<Map<String, dynamic>>>((ref) {
  return [
    {
      'title': 'Christyan Silvia',
      'subtitle': 'Backend Developer',
      'iconAsset': 'assets/icons/user1.png',
    },
    {
      'title': 'Marcos Junior',
      'subtitle': 'Backend Developer',
      'iconAsset': 'assets/icons/user2.png',
    },
    {
      'title': 'Ssaylem Murillo',
      'subtitle': 'Fullstack Developer',
      'iconAsset': 'assets/icons/user3.png',
    },
    {
      'title': 'Andres Rueda',
      'subtitle': 'Frontend Developer',
      'iconAsset': 'assets/icons/user4.png',
    },
    {
      'title': 'Natalie Torres',
      'subtitle': 'UX Designer',
      'iconAsset': 'assets/icons/user1.png',
    },
    {
      'title': 'Leonardo García',
      'subtitle': 'DevOps Engineer',
      'iconAsset': 'assets/icons/user1.png',
    },
    {
      'title': 'Isabella Mendoza',
      'subtitle': 'Mobile Developer',
      'iconAsset': 'assets/icons/user1.png',
    },
    {
      'title': 'Jorge Serrano',
      'subtitle': 'Security Analyst',
      'iconAsset': 'assets/icons/user1.png',
    },
    {
      'title': 'Valeria López',
      'subtitle': 'Data Scientist',
      'iconAsset': 'assets/icons/user1.png',
    },
    {
      'title': 'Mateo Reyes',
      'subtitle': 'QA Engineer',
      'iconAsset': 'assets/icons/user1.png',
    },
    {
      'title': 'Carolina Fuentes',
      'subtitle': 'Product Manager',
      'iconAsset': 'assets/icons/user1.png',
    },
    {
      'title': 'Sebastián Castro',
      'subtitle': 'Cloud Architect',
      'iconAsset': 'assets/icons/user1.png',
    },
    {
      'title': 'Camila Duarte',
      'subtitle': 'AI Researcher',
      'iconAsset': 'assets/icons/user1.png',
    },
    {
      'title': 'Tomás Navarro',
      'subtitle': 'Game Developer',
      'iconAsset': 'assets/icons/user1.png',
    },
  ];
});

