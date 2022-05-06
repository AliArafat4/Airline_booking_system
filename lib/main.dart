import 'package:flutter/material.dart';
import 'package:ics324_project/constants.dart';
import 'package:ics324_project/routs.dart';
import 'package:ics324_project/screens/profile/profile_screen.dart';
import 'package:ics324_project/screens/splash/splash_screen.dart';
import 'package:ics324_project/theme.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fireApp = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      //home: SplashScreen(),
      // initialRoute: SplashScreen.routeName,
      home: FutureBuilder(
          future: _fireApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("you have an erro!${snapshot.error.toString()}");
              return Text("something went wrong!");
            } else if (snapshot.hasData) {
              return SplashScreen();
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      routes: routes,
    );
  }
}
