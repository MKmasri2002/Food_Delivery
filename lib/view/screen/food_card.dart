import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FoodCard extends StatelessWidget {
  String imagePath;
  String title;
  bool isCheck = true;
  FoodCard({super.key, required this.imagePath, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 2,
            left: 2,
            right: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xffffffff),
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),

                Container(
                  //padding: EdgeInsets.all(),
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCheck ? Color(0xff8CC63F) : Color(0xffFFCE00),

                    border: BoxBorder.all(color: Colors.white, width: 2),
                  ),
                  child: isCheck
                      ? Icon(Icons.check, color: Colors.white)
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
