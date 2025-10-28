import 'package:flutter/material.dart';
import 'package:food_delivery/core/constant/app_color.dart';
import 'package:food_delivery/core/constant/image_png.dart';
import 'package:food_delivery/provider/share_provider.dart';
import 'package:food_delivery/view/widget/button/button.dart';
import 'package:food_delivery/view/widget/text/H17.dart';
import 'package:food_delivery/view/widget/text/h1.dart';
import 'package:food_delivery/view/widget/text/h3.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final shareProvider = Provider.of<ShareProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        title: H3(content: 'Sign Up'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      body: Stack(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: shareProvider.height * 0.6,
              width: shareProvider.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(44),
                  topRight: Radius.circular(44),
                ),
                color: AppColor.secondaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  H1(content: 'Create your account'),

                  //const SizedBox(height: 40),
                  Button(
                    onPressed: () async {},
                    content: "Continue with Google",
                    imageUrl: AppPng.google,
                  ),

                  // const SizedBox(height: 20),

                  // النص اللي بوجه لصفحة تسجيل الدخول
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const H17(content: 'Already have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/login");
                        },
                        child: H17(content: 'Log in', color: Color(0xffFFCE00)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
