import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController usernameController;
  final String PrefixIconString;
  final String SuffixIconString;
  final String hintTextValue;
  final bool isObscureText;

  const CustomTextField(
      {super.key,
      required this.usernameController,
      required this.PrefixIconString,
      required this.SuffixIconString,
      required this.hintTextValue,
      required this.isObscureText});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.usernameController,
        obscureText: widget.isObscureText,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            filled: true,
            fillColor: Color(0xffE1E7E7),
            suffixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(widget.SuffixIconString)),
            prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(widget.PrefixIconString)),
            hintText: widget.hintTextValue,
            hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))));
  }
}
