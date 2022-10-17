import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget widget;
  double borderRadius;
  RoundedContainer({super.key, required this.widget, this.borderRadius = 12.0});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        child: widget);
  }
}
