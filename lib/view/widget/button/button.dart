import 'package:flutter/material.dart';

import 'package:food_delivery/provider/share_provider.dart';
import 'package:food_delivery/view/widget/text/h16.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String content;
  final String? imageUrl;
  
  const Button({super.key, required this.onPressed, required this.content, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final shareProvider = Provider.of<ShareProvider>(context);
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xffFFCE00),
        minimumSize: Size(
          shareProvider.width * 0.85,
          shareProvider.width * 0.15,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      icon: imageUrl!=null?Image.asset(imageUrl!,height: 24,):null,
      label:H16(content: content),
    );
  }
}
