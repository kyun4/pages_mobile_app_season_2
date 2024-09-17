import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pagesapp/components/authGate.dart';

import 'package:pagesapp/components/button.dart';
import 'package:pagesapp/components/textfield.dart';
import 'package:pagesapp/pages/mainstream.dart';
import 'package:pagesapp/pages/signup.dart';
import 'package:pagesapp/services/authService.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signInWithEmailAndPassword(
          usernameController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Container(),
            centerTitle: true,
            title: Text(''),
            actions: []),
        body: SafeArea(
            child: Container(
                child: Column(children: [
          Container(
              height: 150,
              width: 125,
              margin: const EdgeInsets.only(top: 35, bottom: 5),
              child: Image.asset('assets/images/pageslogo-orange1.png')),
          SizedBox(
              height: 70,
              child: Text('Pages',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: CustomTextField(
                usernameController: usernameController,
                isObscureText: false,
                PrefixIconString: 'assets/svg/user-alt-1-svgrepo-com.svg',
                SuffixIconString: '',
                hintTextValue: 'Username'),
          ),
          SizedBox(width: 10, child: Container(height: 10)),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: CustomTextField(
                usernameController: passwordController,
                isObscureText: true,
                PrefixIconString: 'assets/svg/lock-alt-svgrepo-com.svg',
                SuffixIconString: '',
                hintTextValue: 'Password'),
          ),
          SizedBox(width: 10, child: Container(height: 10)),
          GestureDetector(
              onTap: () => {signIn()},
              child: ButtonCustom(ButtonText: 'Submit')),
          SizedBox(width: 10, child: Container(height: 20)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Not yet registered? '),
            GestureDetector(
                onTap: () => {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const SignUp();
                      }))
                    },
                child: Text('Signup',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            Text(' here')
          ])
        ]))));
  }
}
