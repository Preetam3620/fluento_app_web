import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'Screens/Question/quiz_handler.dart';
import 'screens/WelcomePage.dart';
import 'Screens/SignInPage.dart';
import 'Screens/SignUpPage1.dart';
import 'Screens/SignUpPage2.dart';
import 'Screens/SignUpPage3.dart';
import 'Screens/HomePage.dart';
import 'Utility/LanguageSelectionCard.dart';
import 'Screens/LanguagePage.dart';
import 'Screens/Question/screens/BeginnerScreens/3OpsImg.dart';
import 'Screens/Question/screens/BeginnerScreens/3OpsNoImg.dart';
import 'Screens/Question/screens/BeginnerScreens/4OpsImg.dart';
import 'Screens/Question/screens/BeginnerScreens/4OpsNoImg.dart';

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
            SelectLanguageCard.routeName: (context) => SelectLanguageCard(),
            LanguagePage.routeName: (context) => LanguagePage(),
            TOpsImg.routeName: (context) => TOpsImg(
                  answer: '',
                  optionD: '',
                  optionA: '',
                  level: '',
                  optionB: '',
                  langName: '',
                  questionText: '',
                  length: 0,
                  title: '',
                  quizNo: '',
                  optionC: '',
                  imageString: '',
                  quesNo: 1,
                ),
            TOpsNoImage.routeName: (context) => TOpsNoImage(
                  optionA: '',
                  level: '',
                  answer: '',
                  optionB: '',
                  optionD: '',
                  langName: '',
                  questionText: '',
                  length: 0,
                  title: '',
                  optionC: '',
                  quizNo: '',
                  quesNo: 1,
                  imageString: '',
                ),
            FOpsImage.routeName: (context) => FOpsImage(
                  answer: '',
                  optionD: '',
                  optionB: '',
                  langName: '',
                  level: '',
                  optionA: '',
                  questionText: '',
                  length: 0,
                  quizNo: '',
                  optionC: '',
                  title: '',
                  imageString: '',
                  quesNo: 1,
                ),
            FOpsNoImage.routeName: (context) => FOpsNoImage(
                  optionB: '',
                  optionD: '',
                  answer: '',
                  level: '',
                  optionA: '',
                  langName: '',
                  optionC: '',
                  title: '',
                  quizNo: '',
                  length: 0,
                  questionText: '',
                  quesNo: 1,
                ),
            QuizHandler.routeName: (context) => QuizHandler(),
          },
          initialRoute: WelcomePage.routeName,
        );
      },
    );
  }
}
