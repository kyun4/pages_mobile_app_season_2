import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pagesapp/components/authGate.dart';
import 'package:pagesapp/components/buttonSecondary.dart';

import 'package:pagesapp/pages/login.dart';
import 'package:pagesapp/pages/mainstream.dart';
import 'package:pagesapp/services/authService.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:provider/provider.dart';

@protected
late QrImage qrImage;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();

    final qrCode = QrCode(8, QrErrorCorrectLevel.H)..addData('mangkanor');
    qrImage = QrImage(qrCode);
  }

  Future<void> signOut() async {
    final _authService = Provider.of<AuthService>(context, listen: false);

    try {
      await _authService.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Login();
      }));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    _authService.signOut();
  } // signOut()

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('catnip32 | itsftac@gmail.com'),
              content: Text('Do you want to logout?'),
              actions: [
                TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      signOut();
                    })
              ]);
        });
  } // _showDialog for Logout

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: GestureDetector(
              onTap: () => {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return MainStream();
                }))
              },
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                      'assets/svg/arrow-left-svgrepo-com.svg')),
            ),
            centerTitle: true,
            title: Text('Profile'),
            actions: []),
        body: Column(children: [
          Expanded(
            child: Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 10,
                      )
                    ],
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                        child: Image.asset('assets/images/catnip1.png',
                            fit: BoxFit.cover, height: 135, width: 135)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Text('@catnip32',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(' | itsftac@gmail.com',
                                style: TextStyle(fontWeight: FontWeight.w300)))
                      ],
                    )
                  ],
                )),
          ),
          Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 15,
                      offset: Offset(4, 4),
                    )
                  ],
                  borderRadius: BorderRadius.circular(20)),
              height: 400,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                        margin: const EdgeInsets.all(30),
                        child: Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                              Text('Profile Fullname',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14)),
                              Text('Full Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              SizedBox(height: 25),
                              Container(
                                  alignment: Alignment.center,
                                  height: 130,
                                  child: PrettyQrView(
                                      qrImage: qrImage,
                                      decoration: const PrettyQrDecoration())),
                              SizedBox(height: 25),
                              Text('Scan this to connect with your profile',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12)),
                              Text('[Random Link]',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                            ]))),
                    GestureDetector(
                        onTap: () => {
                              // Navigator.pushReplacement(context,
                              //     MaterialPageRoute(builder: (context) {
                              //   return Login();
                              // }))
                              _showDialog()
                            },
                        child: ButtonSecondary(
                          buttonText: 'Logout',
                        )),
                  ])),
        ]));
  }
}
