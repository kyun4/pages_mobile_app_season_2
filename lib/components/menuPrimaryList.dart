import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuPrimaryList extends StatelessWidget {
  final String prefixIconString;
  final String listTitle;
  final String listSubTitle;

  const MenuPrimaryList(
      {super.key,
      required this.prefixIconString,
      required this.listTitle,
      required this.listSubTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 15,
                offset: Offset(4, 4))
          ]),
      child: ListTile(
        leading: SvgPicture.asset(prefixIconString),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(listTitle),
          Text(listSubTitle, style: TextStyle(fontSize: 10))
        ]),
      ),
    );
  }
}
