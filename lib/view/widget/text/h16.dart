import 'package:flutter/material.dart';
import 'package:food_delivery/core/constant/app_color.dart';

class H16 extends StatelessWidget {
  final String content;
  const H16({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.content,
      style: TextStyle(
        fontFamily: "Rubik",
        fontWeight: FontWeight.w500,
        height: 1,
        fontSize: 16,
        color: AppColor.primaryColor,
      ),
      textAlign: TextAlign.center,
    );
  }
}
