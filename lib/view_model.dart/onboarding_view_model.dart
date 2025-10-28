import 'package:flutter/material.dart';

class OnBoardingViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void setIndex({required int currentIndex}) {
    _currentIndex = currentIndex;
    notifyListeners();
  }

  void incrementIndex() {
    _currentIndex++;
    notifyListeners();
  }
}
