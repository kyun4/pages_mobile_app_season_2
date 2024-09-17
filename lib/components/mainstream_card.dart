import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pagesapp/components/emoji.dart';
import 'package:pagesapp/components/mainstream_user_profile.dart';

class MainstreamCard extends StatefulWidget {
  const MainstreamCard({super.key});

  @override
  State<MainstreamCard> createState() => _MainstreamCardState();
}

class _MainstreamCardState extends State<MainstreamCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Container(
          margin:
              const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 5),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black45.withOpacity(0.07),
                    spreadRadius: 7,
                    blurRadius: 15,
                    offset: Offset(4, 4))
              ],
              color: const Color.fromARGB(255, 245, 244, 242),
              borderRadius: BorderRadius.circular(12)),
          child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                MainstreamUserProfile(
                  ImageString: 'assets/images/patricksample1.jpg',
                  userDisplayName: 'Patrick',
                  userDisplaySubtitle: 'Friend',
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text('What a great cat day!')),
                  ClipRRect(
                    child: Container(
                        height: MediaQuery.of(context).size.height - 380,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(10),
                        child: Image.asset('assets/images/catnip1.png',
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover)),
                  ),
                  Container(
                      child: Row(children: [
                    Emoji(
                      imageAssetUrl: 'assets/svg/red-heart-svgrepo-com.svg',
                      emojiCount: '4',
                    ),
                    Emoji(
                      imageAssetUrl:
                          'assets/svg/celebration-day-fireworks-svgrepo-com.svg',
                      emojiCount: '3',
                    ),
                    Emoji(
                      imageAssetUrl: 'assets/svg/happy-emoji-svgrepo-com.svg',
                      emojiCount: '1',
                    ),
                    Emoji(
                      imageAssetUrl: 'assets/svg/light-bulb-svgrepo-com.svg',
                      emojiCount: '0',
                    ),
                    Emoji(
                      imageAssetUrl:
                          'assets/svg/sad-but-relieved-face-svgrepo-com.svg',
                      emojiCount: '0',
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width - 280),
                    Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: SvgPicture.asset(
                            'assets/svg/comments-svgrepo-com.svg',
                            height: 20))
                  ]))
                ])
              ]))),
    );
  }
}
