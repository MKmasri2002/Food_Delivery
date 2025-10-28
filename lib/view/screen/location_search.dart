import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:food_delivery/core/router/routes_string.dart';
import 'package:food_delivery/provider/share_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:food_delivery/core/constant/app_color.dart';
import 'package:provider/provider.dart';

// class LocationSearch extends StatefulWidget {
//   @override
//   State<LocationSearch> createState() => _LocationSearchState();
// }

class LocationSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shareProvider = Provider.of<ShareProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(32.556, 35.85), // مركز الخريطة
                initialZoom: 15,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png', // مصدر بديل OSM France
                  subdomains: const ['a', 'b', 'c'],
                  userAgentPackageName: 'com.example.app',
                ),
              ],
            ),
            Positioned(
              top: 10,
              left: 16,
              right: 10,
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Color(0xff515862),
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: shareProvider.width,
                //height: shareProvider.height * 0.4,
                height: 251,

                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(44),
                    topRight: Radius.circular(44),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: shareProvider.width * 0.8,
                      height: shareProvider.width * 0.2,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey,
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
                        Navigator.pushNamed(context, RoutesString.categories);
                      },
                      child: Text(
                        "Set Location",
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
          ],
        ),
      ),
    );
  }
}
