// auth_tabbed_widget.dart
import 'package:devinsight/ui/login/widgets/custom_tab.dart';
import 'package:flutter/material.dart';
import 'login_form.dart';
import 'register_form.dart';

class AuthTabbedWidget extends StatefulWidget {
  const AuthTabbedWidget({super.key});

  @override
  State<AuthTabbedWidget> createState() => _AuthTabbedWidgetState();
}

class _AuthTabbedWidgetState extends State<AuthTabbedWidget> {
  bool isLogin = true;

  void _onTabChanged(bool value) {
    setState(() {
      isLogin = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTab(
          isLogin: isLogin,
          onChanged: _onTabChanged,
        ),
        const SizedBox(height: 30),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isLogin ? const LoginForm() : const RegisterForm(),
        ),
      ],
    );
  }
}
