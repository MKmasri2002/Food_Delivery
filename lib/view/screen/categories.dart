import 'package:flutter/material.dart';
import 'package:food_delivery/core/constant/app_color.dart';
import 'package:food_delivery/core/constant/image_png.dart';
import 'package:food_delivery/core/router/routes_string.dart';
import 'package:food_delivery/provider/share_provider.dart';
import 'package:food_delivery/view/screen/food_card.dart';
import 'package:food_delivery/view/widget/header_screen.dart';
import 'package:provider/provider.dart';

class Category {
  String title;
  String imagePath;
  Category({required this.title, required this.imagePath});
}

class Categories extends StatelessWidget {
  Categories({super.key});
  List<Category> categories = [
    Category(title: "Burger", imagePath: AppPng.burger),
    Category(title: "Pizza", imagePath: AppPng.pizza),
    Category(title: "Fried Rice", imagePath: AppPng.friedRice),
    Category(title: "Cheken", imagePath: AppPng.checken),
    Category(title: "Kabab", imagePath: AppPng.kabab),
    Category(title: "Ice Cream", imagePath: AppPng.iceCream),
  ];
  @override
  Widget build(BuildContext context) {
    final shareProvider = Provider.of<ShareProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(top: 10, left: 25, right: 25),
          child: Column(
            children: [
              HeaderScreen(),
              SizedBox(height: 20),
              SizedBox(
                width: shareProvider.width * 0.7,
                height: shareProvider.height * 0.7,
                child: GridView.count(
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                  children: List.generate(categories.length, (index) {
                    return FoodCard(
                      imagePath: categories[index].imagePath,
                      title: categories[index].title,
                    );
                  }),
                ),
              ),
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
                  Navigator.pushNamed(context, RoutesString.mapScreen);
                },
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontFamily: "Rubik",
                    fontSize: 16,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff05172B),
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
