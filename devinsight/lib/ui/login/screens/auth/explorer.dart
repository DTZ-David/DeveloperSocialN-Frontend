import 'package:devinsight/config/routers/app_router.dart';
import 'package:devinsight/ui/login/widgets/publicationsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:devinsight/ui/login/widgets/navBar.dart';

class Explorer extends ConsumerWidget {
  const Explorer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.lightBlue,
          elevation: 0.2,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          backgroundColor: const Color(0xFF0E0B1F),
          title: GestureDetector(
            onTap: () {
              ref.read(appRouterProvider).go(AppRouter.home);
              
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/saturn.svg',
                  width: 30,
                  height: 30,
                  colorFilter: const ColorFilter.mode(
                    Colors.lightBlue,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Explorer",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
        ),
        backgroundColor: const Color(0xFF0E0B1F),
        bottomNavigationBar: const CustomNavbar(),
        body: const Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 2, left: 30, right: 30, bottom: 10),
              child:  TextField(
                
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.lightBlue,
                decoration: InputDecoration(
                  hintText: "Buscar", // Cambia el texto de la sugerencia aquí,
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.cancel, color: Colors.grey, ),
                )
              ),
            ),


            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Publicationscard(),
                    
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
