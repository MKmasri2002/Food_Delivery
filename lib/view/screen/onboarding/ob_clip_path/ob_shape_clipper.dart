import 'package:flutter/material.dart';

class OBShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width * 0.66, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.4);

    path.quadraticBezierTo(
      size.width * 0.65,
      size.height * 0.6,
      size.width * 0.66,
      size.height * 0.9,
    );

    path.lineTo(size.width * 0.66, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
