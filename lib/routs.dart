import 'package:flutter/widgets.dart';
import 'package:ics324_project/screens/sign_in/sign_in_screen.dart';
import 'package:ics324_project/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  signInScreen.routeName: (context) => signInScreen(),
};
