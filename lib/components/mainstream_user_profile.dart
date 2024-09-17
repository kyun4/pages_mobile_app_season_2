import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pagesapp/pages/login.dart';

class MainstreamUserProfile extends StatefulWidget {
  final String ImageString;
  final String userDisplayName;
  final String userDisplaySubtitle;

  const MainstreamUserProfile(
      {super.key,
      required this.ImageString,
      required this.userDisplayName,
      required this.userDisplaySubtitle});

  @override
  State<MainstreamUserProfile> createState() => _MainstreamUserProfileState();
}

void _showDialog(String postUserDisplay, BuildContext contextHere) {
  showDialog(
      context: contextHere,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('' + postUserDisplay.toString() + '\'s Post Options',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            content: Container(
              height: 60,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () => {Navigator.of(context).pop()},
                        child: Container(child: Text('Hide'))),
                    GestureDetector(
                        onTap: () => {Navigator.of(context).pop()},
                        child: Container(child: Text('Report'))),
                    GestureDetector(
                        onTap: () => {Navigator.of(context).pop()},
                        child: Container(child: Text('Move to Self Tags')))
                  ]),
            ),
            actions: [
              TextButton(
                  iconAlignment: IconAlignment.start,
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ]);
      });
} // _showDialog for Logout

class _MainstreamUserProfileState extends State<MainstreamUserProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            Container(
                margin: const EdgeInsets.only(
                    top: 20, left: 15, right: 15, bottom: 20),
                child: ClipOval(
                    child: Image.asset(widget.ImageString, height: 55))),
            Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Container(
                    child: Text(widget.userDisplayName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                  Container(
                    child: Text(widget.userDisplaySubtitle,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 10)),
                  ),
                ])),
            SizedBox(width: MediaQuery.of(context).size.width - 185),
            GestureDetector(
              onTap: () => {_showDialog('Patrick', context)},
              child: Container(
                  child: SvgPicture.asset(
                      'assets/svg/dots-vertical-svgrepo-com.svg')),
            )
          ]))
    ]));
  }
}
