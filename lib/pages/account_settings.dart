import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pagesapp/pages/account_menu.dart';
import 'package:pagesapp/pages/mainstream.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
            onTap: () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return AccountMenu();
              }))
            },
            child: Container(
                padding: const EdgeInsets.all(10),
                child:
                    SvgPicture.asset('assets/svg/arrow-left-svgrepo-com.svg')),
          ),
          centerTitle: true,
          title: Text('Account Settings'),
          actions: []),
    );
  }
}
