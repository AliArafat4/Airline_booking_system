import 'package:flutter/widgets.dart';
import 'package:ics324_project/screens/details/components/special_for_you.dart';

import 'package:ics324_project/screens/details/details_screen.dart';
import 'package:ics324_project/screens/forgot_password/forgot_password_screen.dart';
import 'package:ics324_project/screens/home/home_screen.dart';
import 'package:ics324_project/screens/login_success/login_success_screens.dart';
import 'package:ics324_project/screens/profile/profile_screen.dart';
import 'package:ics324_project/screens/sign_in/sign_in_screen.dart';
import 'package:ics324_project/screens/splash/splash_screen.dart';

import 'screens/cart/cart_screen.dart';
import 'screens/complete_profile/complete_profile_screen.dart';
import 'screens/otp/otp_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  signInScreen.routeName: (context) => signInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  HomeScreen.routName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  SpecialForYouScreen.routeName: (context) => SpecialForYouScreen(),
};
