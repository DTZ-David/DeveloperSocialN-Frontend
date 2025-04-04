import 'package:devinsight/config/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:devinsight/ui/login/widgets/navBar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0B1F),
      bottomNavigationBar: const CustomNavbar(),
      body: Column(
        children: [
          _buildHeader(context, ref),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                _buildPostCard(
                  context,
                  profileImage: SvgPicture.asset(
                    'assets/icons/saturn.svg',
                    height: 40,
                  ),
                  username: 'Riot Games',
                  time: 'Hoy a las 2 PM',
                  content: 'Bienvenidos al nuevo ajuste de Astra...',
                  codeSnippet: """class Astra {
   public bool CanBypassTejoUlt { get; set; } = true;
public string GetAdjustment() {
   return "Welcome to new adjustment of Astra.";
   
 }
};

class Astra {
   public bool CanBypassTejoUlt { get; set; } = true;
public string GetAdjustment() {
   return "Welcome to new adjustment of Astra.";
   
   """,
                  reactions: [2, 45, 32],
                ),
                _buildPostCard(
                  context,
                  profileImage: SvgPicture.asset(
                    'assets/icons/saturn.svg',
                    height: 40,
                  ),
                  username: 'Riot Games',
                  time: 'Hoy a las 2 PM',
                  content: 'Bienvenidos al nuevo ajuste de Astra...',
                  codeSnippet: """class Astra {
   public bool CanBypassTejoUlt { get; set; } = true;
public string GetAdjustment() {
   return "Welcome to new adjustment of Astra.";
 }
};""",
                  reactions: [2, 45, 32],
                ),
                _buildPostCard(
                  context,
                  profileImage: SvgPicture.asset(
                    'assets/icons/saturn.svg',
                    height: 40,
                  ),
                  username: 'Riot Games',
                  time: 'Hoy a las 2 PM',
                  content: 'Bienvenidos al nuevo ajuste de Astra...',
                  codeSnippet: """class Astra {
   public bool CanBypassTejoUlt { get; set; } = true;
public string GetAdjustment() {
   return "Welcome to new adjustment of Astra.";
 }
};""",
                  reactions: [2, 45, 32],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF1C1A30),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                ref.read(appRouterProvider).go(AppRouter.home);
              },
              child: const Text(
                'DevInsight',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildPostCard(
    BuildContext context, {
    required Widget profileImage,
    required String username,
    required String time,
    required String content,
    required String codeSnippet,
    required List<int> reactions,
  }) {
    String previewSnippet =
        codeSnippet.split('\n').take(5).join('\n') + '\n...';

    return Card(
      color: const Color(0xFF1C1A30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(child: profileImage),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(username,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text(time,
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.fullscreen, color: Colors.white),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: const Color(0xFF1C1A30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.98,
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'view code',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Align(
                                      child: Text(
                                        textAlign: TextAlign.left,
                                        codeSnippet,
                                        style: const TextStyle(
                                          fontFamily: 'monospace',
                                          fontSize: 12,
                                          color: Colors.greenAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'Cerrar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
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
                previewSnippet,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  color: Colors.greenAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}