import 'package:devinsight/config/routers/app_router.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageProfile extends ConsumerWidget {
  const MessageProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColors,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.precision_manufacturing_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              ref.read(appRouterProvider).go(AppRouter.login);
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 1,
        backgroundColor: AppColors.tertiaryColors,
        title: GestureDetector(
          onTap: () {
            ref.read(appRouterProvider).go(AppRouter.profile);
          },
          child: Image.asset(
            alignment: Alignment.center,
            'assets/icons/user1.png',
            fit: BoxFit.fill,
            height: 45,
            width: 45,
          ),
        ),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hola, soy ChecoDev\nun desarrollador apasionado.",
                  textAlign: TextAlign.center,
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/icons/user1.png'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              reverse:
                  true, // Ensures the view scrolls to the bottom when the keyboard appears
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
              ),
            ),
          ),
          // TextField at the bottom
          Padding(
            padding: EdgeInsets.all(4.0),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(),
                suffixIcon: Icon(Icons.send),
                border: OutlineInputBorder(),
                labelText: 'Mensaje',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
