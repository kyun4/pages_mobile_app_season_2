import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Emoji extends StatefulWidget {
  final String imageAssetUrl;
  final String emojiCount;
  const Emoji(
      {super.key, required this.imageAssetUrl, required this.emojiCount});

  @override
  State<Emoji> createState() => _EmojiState();
}

class _EmojiState extends State<Emoji> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, bottom: 10),
        child: Row(children: [
          SvgPicture.asset(widget.imageAssetUrl, height: 25),
          Container(
              padding: const EdgeInsets.only(left: 4),
              child: Text(widget.emojiCount, style: TextStyle(fontSize: 10)))
        ]));
  }
}
