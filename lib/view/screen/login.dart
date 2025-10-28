import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:food_delivery/core/constant/app_color.dart';
import 'package:food_delivery/core/constant/image_png.dart';
import 'package:food_delivery/core/router/routes_string.dart';
import 'package:food_delivery/main.dart';
import 'package:food_delivery/provider/share_provider.dart';
import 'package:food_delivery/view_model.dart/auth_view_model.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final shareProvider = Provider.of<ShareProvider>(context);
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
                            "Get Started Food Lover",
                            style: TextStyle(
                              fontFamily: "Rubik",
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              height: 1.4,
                            ),
                          ),
                          Text(
                            "Insert your phone number",
                            style: TextStyle(
                              fontFamily: "Rubik",
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffE5E5EA),
                              height: 1.4,
                            ),
                          ),
                          SizedBox(height: shareProvider.width * 0.12),
                          TextField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hint: Text(
                                "XXXXXXXXXX",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  shareProvider.countryFlag +
                                      " +" +
                                      shareProvider.countryPhoneCode,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),

                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: shareProvider.width * 0.12),
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
                            onPressed: () async {
                              final authViewModel = Provider.of<AuthViewModel>(
                                context,
                                listen: false,
                              );
                              String phone =
                                  "+" +
                                  shareProvider.countryPhoneCode +
                                  phoneController.text;
                              print("my phone " + phone);
                              await authViewModel.sendOTP(phone);
                              print("good");
                              Navigator.pushNamed(
                                context,
                                RoutesString.loginOtp,
                              );
                              // String otp = "123456"; // OTP وهمي
                              // showOtpNotification(otp);
                              // بعد الإرسال، ننتقل لصفحة OTP
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (_) => OtpPage()),
                              // );
                            },
                            child: Text(
                              "Sent OTP",
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

// Future<void> showOtpNotification(String otp) async {
//   const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
//     'otp_channel',
//     'OTP Notifications',
//     channelDescription: 'Channel for OTP notifications',
//     importance: Importance.max,
//     priority: Priority.high,
//   );

//   const NotificationDetails platformDetails = NotificationDetails(
//     android: androidDetails,
//   );

//   await flutterLocalNotificationsPlugin.show(
//     0,
//     'Your OTP Code',
//     'OTP: $otp',
//     platformDetails,
//   );
// }
