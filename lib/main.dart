import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'screens/WelcomePage.dart';
import 'Screens/SignInPage.dart';
import 'Screens/SignUpPage1.dart';
import 'Screens/SignUpPage2.dart';
import 'Screens/SignUpPage3.dart';
import 'Screens/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fluento',
          routes: {
            WelcomePage.routeName: (context) => const WelcomePage(),
            SignInPage.routeName: (context) => const SignInPage(),
            SignUpPage1.routeName: (context) => const SignUpPage1(),
            SignUpPage2.routeName: (context) => const SignUpPage2(),
            SignUpPage3.routeName: (context) => const SignUpPage3(),
            HomePage.routeName: (context) => HomePage(),
          },
          initialRoute: WelcomePage.routeName,
        );
      },
    );
  }
}
