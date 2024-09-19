import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pagesapp/components/button.dart';
import 'package:pagesapp/components/texrfield_post.dart';
import 'package:pagesapp/components/textfield.dart';
import 'package:pagesapp/pages/mainstream.dart';
import 'package:pagesapp/services/firebaseStorage.dart';
import 'package:pagesapp/services/mainstreamProcess.dart';
import 'package:provider/provider.dart';

class ComposePost extends StatefulWidget {
  const ComposePost({super.key});

  @override
  State<ComposePost> createState() => _ComposePostState();
}

class _ComposePostState extends State<ComposePost> {
  bool isUploadImage = false;
  final mainstreamContentPost = TextEditingController();
  String image_upload_id_generated = '';

  @override
  void uploadImageButtonToggle() {
    setState(() {
      isUploadImage = !isUploadImage;
    });
  } // uploadImageButtonToggle()

  String generateRandomCharacters(int length) {
    const characters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    return String.fromCharCodes(
        Iterable.generate(length, (_) => random.nextInt(characters.length))
            .map((index) => characters.codeUnitAt(index)));
  } //  generateRandomCharacters

  void setImageUploadId(String upload_id) {
    setState(() => {image_upload_id_generated = upload_id});
  } //

  void postMainstreamContent() async {
    setImageUploadId(generateRandomCharacters(12));
    final _mainstreamProcess = MainstreamProcess();

    await _mainstreamProcess.createMainstreamPost(mainstreamContentPost.text,
        '84017664-2776-4faa-b5cf-ea8f07c07b59', image_upload_id_generated);

    mainstreamContentPost.clear();

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const MainStream();
    }));
  } // postMainstreamContent()

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: GestureDetector(
              onTap: () => {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const MainStream();
                }))
              },
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                      'assets/svg/arrow-left-svgrepo-com.svg')),
            ),
            centerTitle: true,
            title: const Text('Compose a Post'),
            actions: [
              Container(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 15, right: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffFD8A02)),
                  margin: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () => {postMainstreamContent()},
                    child: const Text('Post',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ))
            ]),
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              TextFieldPost(
                mainstreamController: mainstreamContentPost,
                hint_text: 'Say anything to your mainstream!',
              ),
              Container(
                height: 75,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(children: [
                          GestureDetector(
                            onTap: () => {
                              FirebaseStoragePagesApp()
                                  .uploadImage(image_upload_id_generated)
                            },
                            child: Container(
                                height: 55,
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xffFD8A02)),
                                    borderRadius: BorderRadius.circular(55)),
                                child: Row(children: [
                                  Padding(
                                      child: Icon(
                                        Icons.image,
                                        color: Color(0xffFD8A02),
                                      ),
                                      padding: const EdgeInsets.all(2)),
                                  Padding(
                                      child: Text('Add Image',
                                          style: TextStyle(
                                              color: Color(0xffFD8A02))),
                                      padding: const EdgeInsets.all(2))
                                ])),
                          ),
                        ]));
                  },
                ),
              ),
              Visibility(
                visible: isUploadImage,
                child: Center(
                  child: GestureDetector(
                      onTap: () => {
                            FirebaseStoragePagesApp()
                                .uploadImage(image_upload_id_generated)
                          },
                      child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 5,
                                    blurRadius: 10,
                                    color: const Color(0xffFD8A02)
                                        .withOpacity(0.1),
                                    offset: const Offset(4, 4))
                              ]),
                          height: 125,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(top: 15),
                                    child: SvgPicture.asset(
                                        'assets/svg/image-upload-svgrepo-com.svg')),
                                Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: const Text('Add Image',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18)))
                              ]))),
                ),
              ),
            ])));
  }
}
