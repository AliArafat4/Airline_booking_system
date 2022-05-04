import 'package:flutter/widgets.dart';
import 'package:ics324_project/screens/complete_profile/complete_profile_screen.dart';
import 'package:ics324_project/screens/forgot_password/forgot_password_screen.dart';
import 'package:ics324_project/screens/home/home_screen.dart';
import 'package:ics324_project/screens/login_success/login_success_screens.dart';
import 'package:ics324_project/screens/otp/otp_screen.dart';
import 'package:ics324_project/screens/sign_in/sign_in_screen.dart';
import 'package:ics324_project/screens/sign_up/sign_up_screen.dart';
import 'package:ics324_project/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  signInScreen.routeName: (context) => signInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routName: (context) => HomeScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
};
