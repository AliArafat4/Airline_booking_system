import 'package:flutter/widgets.dart';
import 'package:ics324_project/screens/forgot_password/forgot_password_screen.dart';
import 'package:ics324_project/screens/home/home_screen.dart';
import 'package:ics324_project/screens/login_success/login_success_screens.dart';
import 'package:ics324_project/screens/sign_in/sign_in_screen.dart';
import 'package:ics324_project/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  signInScreen.routeName: (context) => signInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  HomeScreen.routName: (context) => HomeScreen(),
};
