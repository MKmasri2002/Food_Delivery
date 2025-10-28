import 'package:flutter/material.dart';
import 'package:food_delivery/core/constant/app_color.dart';
import 'package:food_delivery/core/constant/image_png.dart';
import 'package:food_delivery/view/screen/onboarding/ob_page_view/ob_container.dart';
import 'package:food_delivery/view_model.dart/onboarding_view_model.dart';

class OBPageView extends StatelessWidget {
  final OnBoardingViewModel onBoardingViewModel;
  final PageController controller ;
  OBPageView({super.key, required this.onBoardingViewModel, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      onPageChanged: (value) {
        onBoardingViewModel.setIndex(currentIndex: value);
      },
      children: [
        OBContainer(image: AppPng.onBoardingImage1, fit: BoxFit.contain),
        OBContainer(image: AppPng.onBoardingImage2, fit: BoxFit.cover),
        OBContainer(image: AppPng.onBoardingImage3, fit: BoxFit.cover),
      ],
    );
  }
}
