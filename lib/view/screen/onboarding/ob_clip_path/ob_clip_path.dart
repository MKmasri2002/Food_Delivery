import 'package:flutter/material.dart';
import 'package:food_delivery/core/constant/app_color.dart';
import 'package:food_delivery/core/constant/image_png.dart';
import 'package:food_delivery/provider/share_provider.dart';
import 'package:food_delivery/view/screen/onboarding/ob_clip_path/ob_point_indicator.dart';
import 'package:food_delivery/view/screen/onboarding/ob_clip_path/ob_shape_clipper.dart';
import 'package:food_delivery/view/widget/text/h1.dart';
import 'package:food_delivery/view/widget/text/h2.dart';
import 'package:food_delivery/view_model.dart/onboarding_view_model.dart';

class OBClipPath extends StatelessWidget {
  final OnBoardingViewModel onBoardingViewModel;
  final ShareProvider shareProvider;
  const OBClipPath({
    super.key,
    required this.onBoardingViewModel,
    required this.shareProvider,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OBShapeClipper(),
      child: Container(
        padding: EdgeInsets.only(top: 10),

        decoration: BoxDecoration(
          color: AppColor.secondaryColor,
         
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(400),
            topRight: Radius.circular(400),
          ),
    
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: AssetImage(AppPng.onBoardingImage4)),
            H1(content: "Quick delivery at your \nhome address"),
            SizedBox(height: shareProvider.width * 0.01),
            H2(
              content:
                  "Home delivery and online reservation system\n for restaurants and cafe",
            ),
            SizedBox(height: shareProvider.width * 0.1),
            Container(
              width: shareProvider.width,
              padding: EdgeInsets.only(left: 30, top: 25),
              child: OBPointIndicator(onBoardingViewModel: onBoardingViewModel),
            ),
            SizedBox(height: shareProvider.width * 0.1),
          ],
        ),
      ),
    );
  }
}
