import 'package:flutter/material.dart';

class PillCategory extends StatefulWidget {
  final String categoryName;
  final bool isSelected;
  const PillCategory(
      {super.key, required this.categoryName, required this.isSelected});

  @override
  State<PillCategory> createState() => _PillCategoryState();
}

class _PillCategoryState extends State<PillCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        width: 125,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 5),
        child: Text(widget.categoryName,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: widget.isSelected
                    ? Color.fromARGB(255, 245, 238, 234)
                    : Colors.black87)),
        decoration: BoxDecoration(
            border: Border.all(
                color: widget.isSelected
                    ? Colors.white
                    : Color.fromARGB(255, 246, 122, 50).withOpacity(0.1)),
            color: widget.isSelected
                ? Color.fromARGB(255, 246, 122, 50)
                : Color.fromARGB(255, 249, 248, 247),
            borderRadius: BorderRadius.circular(20)));
  }
}
