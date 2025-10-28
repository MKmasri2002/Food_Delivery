import 'package:flutter/material.dart';
import 'package:food_delivery/core/constant/app_color.dart';
import 'package:food_delivery/core/router/routes_string.dart';
import 'package:food_delivery/provider/share_provider.dart';
import 'package:food_delivery/view/screen/onboarding/ob_clip_path/ob_clip_path.dart';
import 'package:food_delivery/view/screen/onboarding/ob_page_view/ob_pageview.dart';
import 'package:food_delivery/view_model.dart/onboarding_view_model.dart';
import 'package:provider/provider.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    final onBoardingViewModel = Provider.of<OnBoardingViewModel>(context);
    final shareProvider = Provider.of<ShareProvider>(context);
    return Scaffold(
      
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: shareProvider.width * -0.1,
              top: shareProvider.height * 0.01,

              child: SizedBox(
                width: shareProvider.width + 30,
                height: shareProvider.width * 0.97,

                child: OBPageView(
                  onBoardingViewModel: onBoardingViewModel,
                  controller: controller,
                ),
              ),
            ),

            Positioned(
              top: shareProvider.height * 0.5,
              left: shareProvider.width * -0.45,
              right: shareProvider.width * -0.45,
              bottom: 0,
              child: OBClipPath(
                onBoardingViewModel: onBoardingViewModel,
                shareProvider: shareProvider,
              ),
            ),
            Positioned(
              bottom: 30,
              right: 20,
              child: IconButton(
                onPressed: () {
                  onBoardingViewModel.incrementIndex();
                  controller.animateToPage(
                    onBoardingViewModel.currentIndex,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                  print(onBoardingViewModel.currentIndex);
                  if (onBoardingViewModel.currentIndex == 3)
                    Navigator.pushNamed(context, RoutesString.countryCode);
                },
                icon: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
