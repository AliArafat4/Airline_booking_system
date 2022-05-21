import 'package:flutter/material.dart';
import '../components/OnboardingInfo.dart';

class OnboardingController {
  int currentPage = 0;

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo("assets/images/splash_1.png", "Sky Flight",
        'Welcome to our airline app'),
    OnboardingInfo(
        "assets/images/splash_2.png", "Sky Flight", 'Choose a destination'),
    OnboardingInfo(
        "assets/images/splash_3.png", "Sky Flight", 'Enjoy your vacation'),
  ];
}
