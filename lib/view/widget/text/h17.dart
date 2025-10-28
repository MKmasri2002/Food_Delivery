import 'package:flutter/material.dart';
import 'package:food_delivery/core/constant/app_color.dart';

class H17 extends StatelessWidget {
  final String content;
  final Color? color;
  const H17({super.key, required this.content, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.content,
      style: TextStyle(
        fontFamily: "Rubik",
        fontWeight: FontWeight.w400,
        height: 1.3,
        fontSize: 17,
        color: color != null ? color : Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }
}
