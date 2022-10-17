import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomizedText extends StatelessWidget {
  final String textcontent;
  final TextAlign position;
  final TextOverflow overflow;
  final style;
  const CustomizedText(
      {super.key,
      required this.textcontent,
      required this.style,
      this.position = TextAlign.left,
      this.overflow = TextOverflow.visible});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: position,
      textcontent,
      style: style,
      overflow: overflow,
    );
  }
}
