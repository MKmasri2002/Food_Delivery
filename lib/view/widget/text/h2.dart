import 'package:flutter/material.dart';
import 'package:food_delivery/core/constant/app_color.dart';

class H2 extends StatelessWidget {
  final String content;
  const H2({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.content,
      style: TextStyle(
        fontFamily: "Rubik",
        fontWeight: FontWeight.w400,
        height: 1.4,
        fontSize: 14,
        color: AppColor.secondaryFontColor,
      ),
      textAlign: TextAlign.center,
    );;
  }
}