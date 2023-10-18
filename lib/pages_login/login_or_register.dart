import 'package:flutter/material.dart';
import 'package:memorydirective/pages_login/login_page.dart';
import 'package:memorydirective/pages_login/register_page.dart';

class LoginorRegisterPage extends StatefulWidget {
  const LoginorRegisterPage({super.key});

  @override
  State<LoginorRegisterPage> createState() => _LoginorRegisterPageState();
}

class _LoginorRegisterPageState extends State<LoginorRegisterPage> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
          onTap: togglePages
      );
    } else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}