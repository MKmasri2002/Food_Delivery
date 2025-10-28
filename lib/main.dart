import 'package:flutter/material.dart';
import 'package:food_delivery/core/router/routes.dart';
import 'package:food_delivery/core/router/routes_string.dart';
import 'package:food_delivery/provider/share_provider.dart';
import 'package:food_delivery/view_model.dart/auth_view_model.dart';
import 'package:food_delivery/view_model.dart/onboarding_view_model.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  print("✅ Firebase has been initialized successfully!");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnBoardingViewModel()),
        ChangeNotifierProvider(create: (_) => ShareProvider()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final shareProvider = Provider.of<ShareProvider>(context);
    shareProvider.setData(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesString.onBoarding,
      routes: routes,
    );
  }
}
