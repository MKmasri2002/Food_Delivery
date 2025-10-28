import 'package:flutter/material.dart';
import 'package:food_delivery/view_model.dart/onboarding_view_model.dart';

class OBPointIndicator extends StatelessWidget {
  final OnBoardingViewModel onBoardingViewModel;
  const OBPointIndicator({super.key, required this.onBoardingViewModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ...List.generate(3, (index) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 3),
            width: onBoardingViewModel.currentIndex == index ? 25 : 6,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          );
        }),
        SizedBox(width: MediaQuery.sizeOf(context).width * 0.4),
      ],
    );
  }
}
