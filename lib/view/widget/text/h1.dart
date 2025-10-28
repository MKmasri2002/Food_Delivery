import 'package:flutter/material.dart';
import 'package:food_delivery/core/constant/app_color.dart';

class H1 extends StatelessWidget {
  final String content;
  const H1({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.content,
      style: TextStyle(
        fontFamily: "Rubik",
        fontWeight: FontWeight.w500,
        height: 1.15,
        fontSize: 26,
        color: AppColor.primaryFontColor,
      ),
      textAlign: TextAlign.center,
    );
  }
}
