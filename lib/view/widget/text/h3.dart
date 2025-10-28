import 'package:flutter/material.dart';
import 'package:food_delivery/core/constant/app_color.dart';

class H3 extends StatelessWidget {
  final String content;
  const H3({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.content,
      style: TextStyle(
        fontFamily: "Rubik",
        fontWeight: FontWeight.w400,
        height: 1.4,
        fontSize: 18,
        color: AppColor.primaryFontColor,
      ),
      textAlign: TextAlign.center,
    );
  }
}
