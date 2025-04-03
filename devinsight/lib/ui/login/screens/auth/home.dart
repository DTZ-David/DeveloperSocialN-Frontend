import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devinsight/config/routers/app_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0B1F),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                _buildPostCard(

                  profileImage: '',
                  username: 'Riot Games',
                  time: 'Hoy a las 2 PM',
                  content: 'Bienvenidos al nuevo ajuste de Astra...',
                  codeSnippet: """
                  class Astra {
                    public bool CanBypassTejoUlt { get; set; } = true;
                    public string GetAdjustment() {
                      return "Welcome to new adjustment of Astra.";
                    }
                  } """,
                  reactions: [2, 45, 32],
                ),
                _buildPostCard(
                  profileImage: '',
                  username: 'Riot Games',
                  time: 'Hoy a las 2 PM',
                  content: 'Bienvenidos al nuevo ajuste de Astra...',
                  codeSnippet: """class Astra {
                    public bool CanBypassTejoUlt { get; set; } = true;
                    public string GetAdjustment() {
                      return "Welcome to new adjustment of Astra.";
                    }
                  } """,
                  reactions: [2, 45, 32],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            
            backgroundImage: AssetImage('assets/icons/saturno.svg'),
          
          ),
          Text(
            
            'DevInsight',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Icon(Icons.notifications, color: Colors.white),
              SizedBox(width: 10),
              Icon(Icons.settings, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPostCard({
    required String profileImage,
    required String username,
    required String time,
    required String content,
    required String codeSnippet,
    required List<int> reactions,
  }) {
    return Card(
      color: const Color(0xFF1C1A30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(profileImage)),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Text(time,
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 12)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(content, style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                codeSnippet,
                style: const TextStyle(

                    fontFamily: 'monospace', color: Colors.greenAccent),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green),
                    Text(' ${reactions[0]}',
                        style: const TextStyle(color: Colors.white)),
                    const SizedBox(width: 10),
                    const Icon(Icons.help_outline, color: Colors.yellow),
                    Text(' ${reactions[1]}',
                        style: const TextStyle(color: Colors.white)),
                    const SizedBox(width: 10),
                    const Icon(Icons.chat_bubble_outline, color: Colors.blue),
                    Text(' ${reactions[2]}',
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
                const Icon(Icons.share, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
