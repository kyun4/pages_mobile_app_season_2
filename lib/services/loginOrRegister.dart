import 'package:flutter/material.dart';
import 'package:pagesapp/pages/login.dart';
import 'package:pagesapp/pages/mainstream.dart';
import 'package:pagesapp/pages/signup.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  @override
  bool showLoginDisplay = true;

  void toggleState() {
    setState(() {
      showLoginDisplay = !showLoginDisplay;
    });
  }

  Widget build(BuildContext context) {
    if (showLoginDisplay) {
      return Login(onTap: toggleState);
    } else {
      return SignUp(onTap: toggleState);
    }
  }
}
