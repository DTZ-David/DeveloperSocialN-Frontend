import 'package:devinsight/ui/login/widgets/auth_tabbed_widget.dart';
import 'package:devinsight/ui/login/widgets/svg_icon.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SvgIcon(
                                assetName: 'assets/icons/saturn.svg',
                                height: 210,
                                width: 210,
                                color: Color(0xFF1ABCFE),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Bienvenido a ",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                  Text(
                                    "DevInsight",
                                    style: TextStyle(
                                      color: Color(0xFF1ABCFE),
                                      fontSize: 22,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Inicia sesión para continuar y disfrutar de un mejor codigo",
                                style: TextStyle(
                                    color: Colors.white60,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Montserrat"),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 32, 28, 31),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 30),
                            child: const AuthTabbedWidget(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
