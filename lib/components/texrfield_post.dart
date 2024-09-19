import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldPost extends StatelessWidget {
  final String hint_text;
  final TextEditingController mainstreamController;

  const TextFieldPost(
      {super.key, required this.hint_text, required this.mainstreamController});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            spreadRadius: 5,
            blurRadius: 15,
            color: Colors.black.withOpacity(0.1),
            offset: Offset(4, 4))
      ]),
      child: TextFormField(
          controller: mainstreamController,
          maxLines: null,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(top: 30, bottom: 30, left: 10),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.white,
              hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              hintText: hint_text)),
    );
  }
}
