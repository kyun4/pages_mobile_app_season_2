import 'package:flutter/material.dart';

class ButtonSecondary extends StatefulWidget {
  final String buttonText;
  const ButtonSecondary({super.key, required this.buttonText});

  @override
  State<ButtonSecondary> createState() => _ButtonSecondaryState();
}

class _ButtonSecondaryState extends State<ButtonSecondary> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
            height: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(55),
                border: Border.all(color: Color(0xffFD8A02), width: 2.0)),
            child: Text(widget.buttonText,
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: Color(0xffFD8A02)))));
  }
}
