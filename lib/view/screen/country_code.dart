import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/constant/app_color.dart';
import 'package:food_delivery/core/constant/image_png.dart';
import 'package:food_delivery/core/router/routes_string.dart';
import 'package:food_delivery/provider/share_provider.dart';
import 'package:food_delivery/view_model.dart/onboarding_view_model.dart';
import 'package:provider/provider.dart';

class CountryCode extends StatelessWidget {
  CountryCode({super.key});

  final allCountries = CountryService().getAll();
  TextEditingController searchController = TextEditingController();

  void filterCountries(String query) {
    List<Country> results = [];
    if (query.isEmpty) {
      results = allCountries;
    } else {
      results = allCountries
          .where(
            (country) =>
                country.name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }

    filteredCountries = results;
  }

  List<Country> filteredCountries = CountryService().getAll();
  @override
  Widget build(BuildContext context) {
    final shareProvider = Provider.of<ShareProvider>(context);
    final onBoardingViewModel = Provider.of<OnBoardingViewModel>(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
        print("hello gesture");
      },
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: shareProvider.width,
              height: shareProvider.height,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.only(top: 25, left: 30),
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
                              onBoardingViewModel.setIndex(currentIndex: 2);
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
                          "Select Country",
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
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColor.secondaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(44),
                          topRight: Radius.circular(44),
                        ),
                      ),
                      width: shareProvider.width,
                      height: shareProvider.height * 0.75,
                      child: Column(
                        children: [
                          SizedBox(height: shareProvider.height * 0.07),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: searchController,
                                  onChanged: (value) {
                                    filterCountries(value);
                                    //shareProvider.update();
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Color(0xff8E8E93).withAlpha(25),
                                    filled: true,
                                    prefixIcon: Icon(
                                      Icons.search,
                                      size: 30,
                                      color: Colors.white.withAlpha(255),
                                    ),
                                    hint: Text(
                                      "Search...",
                                      style: TextStyle(
                                        fontFamily: "Rubik",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        height: 0.6,
                                        color: Colors.white,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: shareProvider.width * 0.02),
                              GestureDetector(
                                onTap: () {
                                  print("ressed");
                                },
                                child: Container(
                                  width: shareProvider.width * 0.2,
                                  height: shareProvider.width * 0.2,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(AppPng.filter),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: filteredCountries.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.all(0),
                                  width: shareProvider.width * 0.8,
                                  height: shareProvider.width * 0.15,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      print(
                                        "hello ${filteredCountries[index].displayName}",
                                      );
                                      shareProvider.setCountry(
                                        countryFlag:
                                            filteredCountries[index].flagEmoji,
                                        countryPhoneCode:
                                            filteredCountries[index].phoneCode,
                                      );
                                      Navigator.pushNamed(
                                        context,
                                        RoutesString.login,
                                      );
                                    },
                                    contentPadding: EdgeInsets.all(0),
                                    leading: Text(
                                      filteredCountries[index].flagEmoji,
                                      style: TextStyle(fontSize: 25),
                                    ),

                                    title: Text(
                                      filteredCountries[index].name,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    trailing: Text(
                                      "+" + filteredCountries[index].phoneCode,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: "Rubik",
                                        fontStyle: FontStyle.normal,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: shareProvider.height * 0.18,
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

///////////////////////////////
Widget countryAvatar(String countryCode) {
  // حوّل الكود لصغير
  final code = countryCode.toLowerCase();

  // الخريطة تضم كل الأكواد اللي موجودة بالـ package
  const availableFlags = [
    'us', 'sa', 'id', 'my', 'bd', 'au', // أضف باقي الدول اللي تستخدمها
  ];

  if (availableFlags.contains(code)) {
    // إذا موجودة الصورة
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.grey[200],
      child: ClipOval(
        child: Image.asset(
          'icons/flags/png100px/$code.png',
          package: 'country_icons',
          width: 32,
          height: 32,
          fit: BoxFit.cover,
        ),
      ),
    );
  } else {
    // fallback
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.grey[200],
      child: Icon(Icons.flag, color: Colors.grey, size: 20),
    );
  }
}
