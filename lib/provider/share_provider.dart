import 'package:flutter/material.dart';

class ShareProvider extends ChangeNotifier {
  double _width = 0;
  double _height = 0;
  String _countryFlag = "";
  String _countryPhoneCode = "";

  double get width => _width;
  double get height => _height;
  String get countryFlag => _countryFlag;
  String get countryPhoneCode => _countryPhoneCode;

  void setData({required double width, required double height}) {
    _width = width;
    _height = height;
  }

  void setCountry({
    required String countryFlag,
    required String countryPhoneCode,
  }) {
    _countryFlag = countryFlag;
    _countryPhoneCode = countryPhoneCode;
  }

  void update() {
    notifyListeners();
  }
}
