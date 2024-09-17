import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pagesapp/components/menuPrimaryList.dart';
import 'package:pagesapp/pages/account_settings.dart';
import 'package:pagesapp/pages/mainstream.dart';
import 'package:pagesapp/pages/moodboard.dart';

class AccountMenu extends StatefulWidget {
  const AccountMenu({super.key});

  @override
  State<AccountMenu> createState() => _AccountMenuState();
}

class _AccountMenuState extends State<AccountMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Account Menu', style: TextStyle(color: Colors.white)),
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
                  'assets/svg/arrow-left-svgrepo-com.svg',
                  color: Colors.white,
                )),
          ),
          backgroundColor: Color(0xffFD8A02),
        ),
        body: Container(
            margin: const EdgeInsets.only(top: 10),
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
              GestureDetector(
                onTap: () => {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return AccountSettings();
                  }))
                },
                child: MenuPrimaryList(
                  prefixIconString: 'assets/svg/user-alt-1-svgrepo-com.svg',
                  listTitle: 'Account Settings',
                  listSubTitle:
                      'View and update your account info and settings',
                ),
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return MoodBoard();
                  }))
                },
                child: MenuPrimaryList(
                  prefixIconString: 'assets/svg/heart-pulse-svgrepo-com.svg',
                  listTitle: 'Moodboard',
                  listSubTitle: 'Create and share your moodboard',
                ),
              )
            ])));
  }
}
