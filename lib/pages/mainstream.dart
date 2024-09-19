import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pagesapp/components/mainstream_card.dart';
import 'package:pagesapp/components/pillcategory.dart';
import 'package:pagesapp/components/textfield_search.dart';
import 'package:pagesapp/pages/account_menu.dart';
import 'package:pagesapp/pages/compose_post.dart';
import 'package:pagesapp/pages/login.dart';
import 'package:pagesapp/pages/messaging.dart';
import 'package:pagesapp/pages/profile.dart';

class MainStream extends StatefulWidget {
  const MainStream({super.key});

  @override
  State<MainStream> createState() => _MainStreamState();
}

Widget _categoryBuilderList() {
  return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection('category_list').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Firestore Error');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('...');
        }

        return ListView(
          scrollDirection: Axis.horizontal,
          children: snapshot.data!.docs
              .map<Widget>((doc) => categoryBuilderItem(doc))
              .toList(),
        );
      });
}

Route _page(route) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => route,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Widget categoryBuilderItem(DocumentSnapshot document) {
  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

  return PillCategory(
      categoryName: data['category_name'],
      isSelected: data['category_name'] == "All" ? true : false);
}

Widget _mainstreamContentBuilder(DocumentSnapshot document) {
  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

  return MainstreamCard(mainstreamPostContent: data['caption_content']);
}

class _MainStreamState extends State<MainStream> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          SafeArea(
              child: Container(
            margin:
                const EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const Profile();
                    }))
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10, top: 3),
                    child: ClipOval(
                        child: Image.asset('assets/images/catnip1.png',
                            fit: BoxFit.cover, height: 35, width: 35)),
                  ),
                ),
                const Text('Welcome',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Text(' Catnip!',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const Messaging();
                          }))
                        },
                        child: Container(
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.only(right: 24),
                            child: SvgPicture.asset(
                                'assets/svg/chat-dots-svgrepo-com.svg')),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.of(context).push(_page(const AccountMenu()))
                        },
                        child: Container(
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.only(right: 5),
                            child: SvgPicture.asset(
                                'assets/svg/hamburger-4-svgrepo-com.svg')),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
          SafeArea(
            child: Container(
              margin: const EdgeInsets.only(top: 8, left: 20, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: CustomTextFieldSearch(
                            usernameController: searchController,
                            PrefixIconString:
                                'assets/svg/search-svgrepo-com.svg',
                            SuffixIconString:
                                'assets/svg/filter-svgrepo-com.svg',
                            hintTextValue: 'Search Keywords',
                            isObscureText: false)),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: GestureDetector(
                            onTap: () => {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const ComposePost();
                                  }))
                                },
                            child: Container(
                                child: SvgPicture.asset(
                                    'assets/svg/plus-circle-1441-svgrepo-com.svg'))))
                  ]),
            ),
          ),
          Visibility(
            visible: true,
            child: Container(
                margin: const EdgeInsets.only(top: 18, left: 20, bottom: 10),
                height: 35,
                child: _categoryBuilderList()),
          ),
          Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('mainstream_content')
                      .snapshots(),
                  builder: (content, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      CircularProgressIndicator(
                        backgroundColor: Color(0xffFD8A02),
                      );
                    }

                    return ListView(
                      scrollDirection: Axis.vertical,
                      children: snapshot.data!.docs
                          .map<Widget>((doc) => _mainstreamContentBuilder(doc))
                          .toList(),
                    );
                  }))
        ]),
      ),
    );
  }
}
