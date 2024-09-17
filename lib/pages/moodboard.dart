import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pagesapp/pages/account_menu.dart';

class MoodBoard extends StatefulWidget {
  const MoodBoard({super.key});

  @override
  State<MoodBoard> createState() => _MoodBoardState();
}

class _MoodBoardState extends State<MoodBoard> {
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
          title: Text('Moodboard'),
          actions: []),
    );
  }
}
