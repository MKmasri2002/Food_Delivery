import 'package:flutter/material.dart';
import 'package:food_delivery/core/constant/app_color.dart';
import 'package:food_delivery/core/constant/image_png.dart';
import 'package:food_delivery/core/router/routes_string.dart';
import 'package:food_delivery/provider/share_provider.dart';
import 'package:food_delivery/view_model.dart/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginOTP extends StatelessWidget {
  LoginOTP({super.key});
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final shareProvider = Provider.of<ShareProvider>(context);
    final authViewModel = Provider.of<AuthViewModel>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColor.primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: shareProvider.width,
              height: shareProvider.height * 0.958,
              child: Stack(
                children: [
                  Positioned(
                    top: shareProvider.width * 0.02,
                    left: shareProvider.width * 0.04,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            color: Color(0xff),
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(8),
                          ),

                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        Text(
                          "Phone Varification",
                          style: TextStyle(
                            fontFamily: "Rubik",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            height: 1.4,
                          ),

                          //textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(shareProvider.width * 0.12),
                      width: shareProvider.width,
                      height: shareProvider.height * 0.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(44),
                          topRight: Radius.circular(44),
                        ),
                        color: AppColor.secondaryColor,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Number Varification",
                            style: TextStyle(
                              fontFamily: "Rubik",
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              height: 1.4,
                            ),
                          ),
                          Text(
                            "+" +
                                shareProvider.countryPhoneCode +
                                // " " +
                                authViewModel.phone
                                    .replaceAll("+962", " ")
                                    .replaceRange(4, 8, "XXXX"),
                            style: TextStyle(
                              fontFamily: "Rubik",
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffE5E5EA),
                              height: 1.4,
                            ),
                          ),
                          SizedBox(height: shareProvider.width * 0.12),
                          PinCodeTextField(
                            appContext: context,
                            length: 6,
                            keyboardType: TextInputType.phone,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(15),

                              inactiveFillColor: Color(
                                0xff000000,
                              ).withAlpha(50),
                              activeFillColor: Color(0xff000000).withAlpha(50),
                              selectedFillColor: Color(
                                0xff000000,
                              ).withAlpha(50),
                              activeColor: Colors.transparent,
                              inactiveColor: Colors.transparent,
                              selectedColor: Colors.transparent,
                            ),
                            enableActiveFill: true,
                            enablePinAutofill: true,
                          ),

                          //SizedBox(height: shareProvider.width * 0.001),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Resend",
                                  style: TextStyle(color: Color(0xffFFCE00)),
                                ),
                              ),
                              Text(
                                "OTP in 30 seconds",
                                style: TextStyle(color: Color(0xffffffff)),
                              ),
                            ],
                          ),
                          SizedBox(height: shareProvider.width * 0.001),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffFFCE00),
                              minimumSize: Size(
                                shareProvider.width * 0.85,
                                shareProvider.width * 0.15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                RoutesString.categories,
                              );
                            },
                            child: Text(
                              "Submit OTP",
                              style: TextStyle(
                                fontFamily: "Rubik",
                                fontSize: 16,
                                height: 0.8,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff05172B),
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: shareProvider.height * 0.15,
                    left: shareProvider.width * 0.4,
                    child: CircleAvatar(
                      maxRadius: shareProvider.width * 0.1,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(AppPng.logoImage2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
