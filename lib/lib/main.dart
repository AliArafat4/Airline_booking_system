import 'package:flutter/material.dart';
import 'package:ics324_project/constants.dart';
import 'package:ics324_project/routs.dart';
import 'package:ics324_project/screens/profile/profile_screen.dart';
import 'package:ics324_project/screens/splash/splash_screen.dart';
import 'package:ics324_project/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: theme(),
      //home: SplashScreen(),
      initialRoute: SplashScreen.routeName,

      routes: routes,
    );
  }
}
