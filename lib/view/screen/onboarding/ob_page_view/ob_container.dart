import 'package:flutter/material.dart';

class OBContainer extends StatelessWidget {
  final String image;
  final BoxFit fit;
  const OBContainer({
    super.key,
    required this.image,
    required this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: fit),
      ),
    );
  }
}
