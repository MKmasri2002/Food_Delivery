import 'package:flutter/material.dart';
import 'package:food_delivery/core/constant/image_png.dart';
import 'package:food_delivery/provider/share_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String? _mapStyle;

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
  }

  Future<void> _loadMapStyle() async {
    final style = await rootBundle.loadString('assets/map_style.json');
    setState(() {
      _mapStyle = style;
    });
  }

  @override
  Widget build(BuildContext context) {
    final shareProvider = Provider.of<ShareProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          _mapStyle == null
              ? const Center(child: CircularProgressIndicator())
              : GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(31.95, 35.93), // الأردن
                    zoom: 10,
                  ),
                  style: _mapStyle, // ✅ هي البديل عن setMapStyle
                ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  // controller: searchController,
                  onChanged: (value) {},
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
                      borderSide: BorderSide(color: Color(0xff)),
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
                    image: DecorationImage(image: AssetImage(AppPng.filter)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
