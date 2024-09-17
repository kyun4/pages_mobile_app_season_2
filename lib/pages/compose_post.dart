import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pagesapp/pages/mainstream.dart';

class ComposePost extends StatefulWidget {
  const ComposePost({super.key});

  @override
  State<ComposePost> createState() => _ComposePostState();
}

class _ComposePostState extends State<ComposePost> {
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
                child:
                    SvgPicture.asset('assets/svg/arrow-left-svgrepo-com.svg')),
          ),
          centerTitle: true,
          title: Text('Compose a Post'),
          actions: []),
    );
  }
}
