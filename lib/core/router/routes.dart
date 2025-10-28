import 'package:flutter/material.dart';
import 'package:food_delivery/core/router/routes_string.dart';
import 'package:food_delivery/view/screen/categories.dart';
import 'package:food_delivery/view/screen/google_map.dart';

import 'package:food_delivery/view/screen/onboarding/onboarding.dart';
import 'package:food_delivery/view/screen/country_code.dart';
import 'package:food_delivery/view/screen/location_search.dart';
import 'package:food_delivery/view/screen/login.dart';
import 'package:food_delivery/view/screen/login_otp.dart';
import 'package:food_delivery/view/screen/signup/signup.dart';
import 'package:food_delivery/view/screen/ttttttt.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  RoutesString.onBoarding: (context) => OnBoarding(),
  RoutesString.countryCode: (context) => CountryCode(),
  RoutesString.login: (context) => Login(),
  RoutesString.loginOtp: (context) => LoginOTP(),
  RoutesString.categories: (context) => Categories(),
  RoutesString.locationSearch: (context) => LocationSearch(),
  RoutesString.mapScreen: (context) => MapScreen(),
  RoutesString.signUp: (context) => SignUp(),
  RoutesString.authPage: (context) => AuthPage(),
};
