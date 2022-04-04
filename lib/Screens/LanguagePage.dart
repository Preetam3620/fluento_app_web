import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/Screens/Question/models/english_que.dart';
import '/Screens/Question/models/hindi_que.dart';
import '/Screens/Question/models/spanish_que.dart';
import '/Screens/Question/quiz_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class LanguagePage extends StatefulWidget {
  static const routeName = '/LanguagePage';
  const LanguagePage({Key? key}) : super(key: key);

  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    final langName = ModalRoute.of(context)!.settings.arguments as String;
    print(langName);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF373768),
          automaticallyImplyLeading: true,
          title: const Text(
            'Fluento',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          elevation: 5,
        ),
        backgroundColor: const Color(0xFF1A1A2F),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FutureBuilder<DocumentSnapshot>(
            future: getUserDocRef(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: Text('Data is loading'));
              } else {
                Map<String, dynamic> profile = snapshot.data!.data() as Map<String, dynamic>;
                print(profile['languages'][langName]['beginner']['Tutorial1'].runtimeType);

                return ListView(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          langName,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.11,
                            height: MediaQuery.of(context).size.width * 0.11,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              'assets/images/$langName.svg',
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Divider(color: Colors.white),
                    // beginner
                    ExpansionTile(
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      title: Text(
                        'Beginner',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      children: <Widget>[
                        // Numbers
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiTutNumber;
                                break;
                              case 'English':
                                quizl = EnglishTutNumber;
                                break;
                              case 'Spanish':
                                quizl = SpanishTutNumber;
                                break;
                              case 'German':
                                quizl = HindiTutNumber;
                                break;
                              case 'French':
                                quizl = HindiTutNumber;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Module 1: Numbers',
                              'quizNo': 'Tutorial1',
                              'score': profile['languages'][langName]['beginner']['Tutorial1'],
                              'level': 'beginner',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Module 1: ',
                              style: k20TextStyle.copyWith(color: Colors.blueAccent),
                              children: [
                                TextSpan(text: 'Numbers', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['beginner']['Tutorial1'].toString(), style: k20TextStyle), // TODO: ADD score
                        ),
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiQuizNumber;
                                break;
                              case 'English':
                                quizl = EnglishQuizNumber;
                                break;
                              case 'Spanish':
                                quizl = SpanishQuizNumber;
                                break;
                              case 'German':
                                quizl = HindiQuizNumber;
                                break;
                              case 'French':
                                quizl = HindiQuizNumber;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Quiz 1: Numbers',
                              'quizNo': 'Quiz1',
                              'score': profile['languages'][langName]['beginner']['Quiz1'],
                              'level': 'beginner',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Quiz 1: ',
                              style: k20TextStyle.copyWith(color: Colors.yellow),
                              children: [
                                TextSpan(text: 'Numbers', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['beginner']['Quiz1'].toString(), style: k20TextStyle), //TODO: ADD score
                        ),

                        // Animals
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiTutAnimals;
                                break;
                              case 'English':
                                quizl = EnglishTutAnimals;
                                break;
                              case 'Spanish':
                                quizl = SpanishTutAnimals;
                                break;
                              case 'German':
                                quizl = HindiTutNumber;
                                break;
                              case 'French':
                                quizl = HindiTutNumber;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Module 2: Animals',
                              'quizNo': 'Tutorial2',
                              'score': profile['languages'][langName]['beginner']['Tutorial2'],
                              'level': 'beginner',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Module 2: ',
                              style: k20TextStyle.copyWith(color: Colors.blueAccent),
                              children: [
                                TextSpan(text: 'Animals', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['beginner']['Tutorial2'].toString().toString(),
                              style: k20TextStyle), //TODO:ADD score
                        ),
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'English':
                                quizl = EnglishQuizAnimals;
                                break;
                              case 'Spanish':
                                quizl = SpanishQuizAnimals;
                                break;
                              case 'German':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'French':
                                quizl = HindiQuizAnimals;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Quiz 2: Animals',
                              'quizNo': 'Quiz2',
                              'score': profile['languages'][langName]['beginner']['Quiz2'],
                              'level': 'beginner',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Quiz 2: ',
                              style: k20TextStyle.copyWith(color: Colors.yellow),
                              children: [
                                TextSpan(text: 'Animals', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['beginner']['Quiz2'].toString(), style: k20TextStyle), //TODO:ADD score
                        ),

                        // Colors
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiTutColour;
                                break;
                              case 'English':
                                quizl = EnglishTutColors;
                                break;
                              case 'Spanish':
                                quizl = SpanishTutColour;
                                break;
                              case 'German':
                                quizl = HindiTutColour;
                                break;
                              case 'French':
                                quizl = HindiTutColour;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Module 3: Colors',
                              'quizNo': 'Tutorial3',
                              'score': profile['languages'][langName]['beginner']['Tutorial3'],
                              'level': 'beginner',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Module 3: ',
                              style: k20TextStyle.copyWith(color: Colors.blueAccent),
                              children: [
                                TextSpan(text: 'Colors', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['beginner']['Tutorial3'].toString().toString(),
                              style: k20TextStyle), //TODO:ADD score
                        ),
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiQuizColor;
                                break;
                              case 'English':
                                quizl = EnglishQuizColors;
                                break;
                              case 'Spanish':
                                quizl = SpanishQuizColor;
                                break;
                              case 'German':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'French':
                                quizl = HindiQuizAnimals;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Quiz 3: Colors',
                              'quizNo': 'Quiz3',
                              'score': profile['languages'][langName]['beginner']['Quiz3'],
                              'level': 'beginner',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Quiz 3: ',
                              style: k20TextStyle.copyWith(color: Colors.yellow),
                              children: [
                                TextSpan(text: 'Colors', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['beginner']['Quiz1'].toString(), style: k20TextStyle), //TODO:ADD score
                        ),

                        // Greetings
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiTutGreetings;
                                break;
                              case 'English':
                                quizl = EnglishTutGreetings;
                                break;
                              case 'Spanish':
                                quizl = SpanishTutGreetings;
                                break;
                              case 'German':
                                quizl = HindiTutNumber;
                                break;
                              case 'French':
                                quizl = HindiTutNumber;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Module 4: Greetings',
                              'quizNo': 'Tutorial4',
                              'score': profile['languages'][langName]['beginner']['Tutorial4'],
                              'level': 'beginner',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Module 4: ',
                              style: k20TextStyle.copyWith(color: Colors.blueAccent),
                              children: [
                                TextSpan(text: 'Greetings', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['beginner']['Tutorial4'].toString().toString(),
                              style: k20TextStyle), //TODO:ADD score
                        ),
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiQuizGreetings;
                                break;
                              case 'English':
                                quizl = EnglishQuizGreetings;
                                break;
                              case 'Spanish':
                                quizl = SpanishQuizGreetings;
                                break;
                              case 'German':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'French':
                                quizl = HindiQuizAnimals;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Quiz 4: Greetings',
                              'quizNo': 'Quiz4',
                              'score': profile['languages'][langName]['beginner']['Quiz4'],
                              'level': 'beginner',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Quiz 4: ',
                              style: k20TextStyle.copyWith(color: Colors.yellow),
                              children: [
                                TextSpan(text: 'Greetings', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['beginner']['Quiz4'].toString(), style: k20TextStyle), //TODO:ADD score
                        ),

                        // Family Tree
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiTutFamily;
                                break;
                              case 'English':
                                quizl = EnglishTutFamily;
                                break;
                              case 'Spanish':
                                quizl = SpanishTutFamily;
                                break;
                              case 'German':
                                quizl = HindiTutNumber;
                                break;
                              case 'French':
                                quizl = HindiTutNumber;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Module 5: Family',
                              'quizNo': 'Tutorial5',
                              'score': profile['languages'][langName]['beginner']['Tutorial5'],
                              'level': 'beginner',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Module 5: ',
                              style: k20TextStyle.copyWith(color: Colors.blueAccent),
                              children: [
                                TextSpan(text: 'Family Tree', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['beginner']['Tutorial5'].toString().toString(),
                              style: k20TextStyle), //TODO:ADD score
                        ),
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiQuizFamily;
                                break;
                              case 'English':
                                quizl = EnglishQuizFamily;
                                break;
                              case 'Spanish':
                                quizl = SpanishQuizFamily;
                                break;
                              case 'German':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'French':
                                quizl = HindiQuizAnimals;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Quiz 5: Family Tree',
                              'quizNo': 'Quiz5',
                              'score': profile['languages'][langName]['beginner']['Quiz5'],
                              'level': 'beginner',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Quiz 5: ',
                              style: k20TextStyle.copyWith(color: Colors.yellow),
                              children: [
                                TextSpan(text: 'Family Tree', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['beginner']['Quiz5'].toString(), style: k20TextStyle), //TODO:ADD score
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    // intermediate
                    ExpansionTile(
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      title: Text(
                        'Intermediate',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      children: <Widget>[
                        // Numbers
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiTutNumber;
                                break;
                              case 'English':
                                quizl = EnglishTutNumber;
                                break;
                              case 'Spanish':
                                quizl = HindiTutNumber;
                                break;
                              case 'German':
                                quizl = HindiTutNumber;
                                break;
                              case 'French':
                                quizl = HindiTutNumber;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Module 1: Numbers',
                              'quizNo': 'Tutorial1',
                              'score': profile['languages'][langName]['intermediate']['Tutorial1'],
                              'level': 'Intermediate',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Module 1: ',
                              style: k20TextStyle.copyWith(color: Colors.blueAccent),
                              children: [
                                TextSpan(text: 'Numbers', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing:
                              Text(profile['languages'][langName]['intermediate']['Tutorial1'].toString(), style: k20TextStyle), // TODO: ADD score
                        ),
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiQuizNumber;
                                break;
                              case 'English':
                                quizl = EnglishQuizNumber;
                                break;
                              case 'Spanish':
                                quizl = HindiQuizNumber;
                                break;
                              case 'German':
                                quizl = HindiQuizNumber;
                                break;
                              case 'French':
                                quizl = HindiQuizNumber;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Quiz 1: Numbers',
                              'quizNo': 'Quiz1',
                              'score': profile['languages'][langName]['intermediate']['Quiz1'],
                              'level': 'intermediate',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Quiz 1: ',
                              style: k20TextStyle.copyWith(color: Colors.yellow),
                              children: [
                                TextSpan(text: 'Numbers', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['intermediate']['Quiz1'].toString(), style: k20TextStyle), //TODO: ADD score
                        ),

                        // Animals
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiTutAnimals;
                                break;
                              case 'English':
                                quizl = EnglishTutAnimals;
                                break;
                              case 'Spanish':
                                quizl = HindiTutNumber;
                                break;
                              case 'German':
                                quizl = HindiTutNumber;
                                break;
                              case 'French':
                                quizl = HindiTutNumber;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Module 2: Animals',
                              'quizNo': 'Tutorial2',
                              'score': profile['languages'][langName]['intermediate']['Tutorial2'],
                              'level': 'intermediate',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Module 2: ',
                              style: k20TextStyle.copyWith(color: Colors.blueAccent),
                              children: [
                                TextSpan(text: 'Animals', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['intermediate']['Tutorial2'].toString().toString(),
                              style: k20TextStyle), //TODO:ADD score
                        ),
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'English':
                                quizl = EnglishQuizAnimals;
                                break;
                              case 'Spanish':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'German':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'French':
                                quizl = HindiQuizAnimals;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Quiz 2: Animals',
                              'quizNo': 'Quiz2',
                              'score': profile['languages'][langName]['beginner']['Quiz2'],
                              'level': 'beginner',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Quiz 2: ',
                              style: k20TextStyle.copyWith(color: Colors.yellow),
                              children: [
                                TextSpan(text: 'Animals', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['beginner']['Quiz2'].toString(), style: k20TextStyle), //TODO:ADD score
                        ),

                        // Colors
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiTutColour;
                                break;
                              case 'English':
                                quizl = EnglishTutColors;
                                break;
                              case 'Spanish':
                                quizl = HindiTutColour;
                                break;
                              case 'German':
                                quizl = HindiTutColour;
                                break;
                              case 'French':
                                quizl = HindiTutColour;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Module 3: Colors',
                              'quizNo': 'Tutorial3',
                              'score': profile['languages'][langName]['beginner']['Tutorial3'],
                              'level': 'beginner',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Module 3: ',
                              style: k20TextStyle.copyWith(color: Colors.blueAccent),
                              children: [
                                TextSpan(text: 'Colors', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['beginner']['Tutorial3'].toString().toString(),
                              style: k20TextStyle), //TODO:ADD score
                        ),
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiTutColour;
                                break;
                              case 'English':
                                quizl = EnglishQuizColors;
                                break;
                              case 'Spanish':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'German':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'French':
                                quizl = HindiQuizAnimals;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Quiz 3: Colors',
                              'quizNo': 'Quiz3',
                              'score': profile['languages'][langName]['beginner']['Quiz3'],
                              'level': 'beginner',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Quiz 3: ',
                              style: k20TextStyle.copyWith(color: Colors.yellow),
                              children: [
                                TextSpan(text: 'Colors', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['beginner']['Quiz1'].toString(), style: k20TextStyle), //TODO:ADD score
                        ),

                        // Greetings
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiTutGreetings;
                                break;
                              case 'English':
                                quizl = EnglishTutGreetings;
                                break;
                              case 'Spanish':
                                quizl = HindiTutNumber;
                                break;
                              case 'German':
                                quizl = HindiTutNumber;
                                break;
                              case 'French':
                                quizl = HindiTutNumber;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Module 4: Greetings',
                              'quizNo': 'Tutorial4',
                              'score': profile['languages'][langName]['beginner']['Tutorial4'],
                              'level': 'beginner',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Module 4: ',
                              style: k20TextStyle.copyWith(color: Colors.blueAccent),
                              children: [
                                TextSpan(text: 'Greetings', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['beginner']['Tutorial4'].toString().toString(),
                              style: k20TextStyle), //TODO:ADD score
                        ),
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiQuizGreetings;
                                break;
                              case 'English':
                                quizl = EnglishQuizGreetings;
                                break;
                              case 'Spanish':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'German':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'French':
                                quizl = HindiQuizAnimals;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Quiz 4: Greetings',
                              'quizNo': 'Quiz4',
                              'score': profile['languages'][langName]['beginner']['Quiz4'],
                              'level': 'beginner',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Quiz 4: ',
                              style: k20TextStyle.copyWith(color: Colors.yellow),
                              children: [
                                TextSpan(text: 'Greetings', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['beginner']['Quiz4'].toString(), style: k20TextStyle), //TODO:ADD score
                        ),

                        // Family Tree
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiTutFamily;
                                break;
                              case 'English':
                                quizl = EnglishTutFamily;
                                break;
                              case 'Spanish':
                                quizl = HindiTutNumber;
                                break;
                              case 'German':
                                quizl = HindiTutNumber;
                                break;
                              case 'French':
                                quizl = HindiTutNumber;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Module 5: Family',
                              'quizNo': 'Tutorial5',
                              'score': profile['languages'][langName]['beginner']['Tutorial5'],
                              'level': 'beginner',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Module 5: ',
                              style: k20TextStyle.copyWith(color: Colors.blueAccent),
                              children: [
                                TextSpan(text: 'Family Tree', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['beginner']['Tutorial5'].toString().toString(),
                              style: k20TextStyle), //TODO:ADD score
                        ),
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiQuizFamily;
                                break;
                              case 'English':
                                quizl = EnglishQuizFamily;
                                break;
                              case 'Spanish':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'German':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'French':
                                quizl = HindiQuizAnimals;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Quiz 5: Family Tree',
                              'quizNo': 'Quiz5',
                              'score': profile['languages'][langName]['beginner']['Quiz5'],
                              'level': 'beginner',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Quiz 5: ',
                              style: k20TextStyle.copyWith(color: Colors.yellow),
                              children: [
                                TextSpan(text: 'Family Tree', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['beginner']['Quiz5'].toString(), style: k20TextStyle), //TODO:ADD score
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    // advance
                    ExpansionTile(
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      title: Text(
                        'Advance',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      children: <Widget>[
                        // Numbers
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiTutNumber;
                                break;
                              case 'English':
                                quizl = EnglishTutNumber;
                                break;
                              case 'Spanish':
                                quizl = HindiTutNumber;
                                break;
                              case 'German':
                                quizl = HindiTutNumber;
                                break;
                              case 'French':
                                quizl = HindiTutNumber;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Module 1: Numbers',
                              'quizNo': 'Tutorial1',
                              'score': profile['languages'][langName]['advance']['Tutorial1'],
                              'level': 'advance',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Module 1: ',
                              style: k20TextStyle.copyWith(color: Colors.blueAccent),
                              children: [
                                TextSpan(text: 'Numbers', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['advance']['Tutorial1'].toString(), style: k20TextStyle), // TODO: ADD score
                        ),
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiQuizNumber;
                                break;
                              case 'English':
                                quizl = EnglishQuizNumber;
                                break;
                              case 'Spanish':
                                quizl = HindiQuizNumber;
                                break;
                              case 'German':
                                quizl = HindiQuizNumber;
                                break;
                              case 'French':
                                quizl = HindiQuizNumber;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Quiz 1: Numbers',
                              'quizNo': 'Quiz1',
                              'score': profile['languages'][langName]['advance']['Quiz1'],
                              'level': 'advance',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Quiz 1: ',
                              style: k20TextStyle.copyWith(color: Colors.yellow),
                              children: [
                                TextSpan(text: 'Numbers', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['advance']['Quiz1'].toString(), style: k20TextStyle), //TODO: ADD score
                        ),

                        // Animals
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiTutAnimals;
                                break;
                              case 'English':
                                quizl = EnglishTutAnimals;
                                break;
                              case 'Spanish':
                                quizl = HindiTutNumber;
                                break;
                              case 'German':
                                quizl = HindiTutNumber;
                                break;
                              case 'French':
                                quizl = HindiTutNumber;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Module 2: Animals',
                              'quizNo': 'Tutorial2',
                              'score': profile['languages'][langName]['advance']['Tutorial2'],
                              'level': 'advance',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Module 2: ',
                              style: k20TextStyle.copyWith(color: Colors.blueAccent),
                              children: [
                                TextSpan(text: 'Animals', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['advance']['Tutorial2'].toString().toString(),
                              style: k20TextStyle), //TODO:ADD score
                        ),
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'English':
                                quizl = EnglishQuizAnimals;
                                break;
                              case 'Spanish':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'German':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'French':
                                quizl = HindiQuizAnimals;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Quiz 2: Animals',
                              'quizNo': 'Quiz2',
                              'score': profile['languages'][langName]['advance']['Quiz2'],
                              'level': 'advance',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Quiz 2: ',
                              style: k20TextStyle.copyWith(color: Colors.yellow),
                              children: [
                                TextSpan(text: 'Animals', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['advance']['Quiz2'].toString(), style: k20TextStyle), //TODO:ADD score
                        ),

                        // Colors
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiTutColour;
                                break;
                              case 'English':
                                quizl = EnglishTutColors;
                                break;
                              case 'Spanish':
                                quizl = HindiTutColour;
                                break;
                              case 'German':
                                quizl = HindiTutColour;
                                break;
                              case 'French':
                                quizl = HindiTutColour;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Module 3: Colors',
                              'quizNo': 'Tutorial3',
                              'score': profile['languages'][langName]['advance']['Tutorial3'],
                              'level': 'advance',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Module 3: ',
                              style: k20TextStyle.copyWith(color: Colors.blueAccent),
                              children: [
                                TextSpan(text: 'Colors', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['advance']['Tutorial3'].toString().toString(),
                              style: k20TextStyle), //TODO:ADD score
                        ),
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiTutColour;
                                break;
                              case 'English':
                                quizl = EnglishQuizColors;
                                break;
                              case 'Spanish':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'German':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'French':
                                quizl = HindiQuizAnimals;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Quiz 3: Colors',
                              'quizNo': 'Quiz3',
                              'score': profile['languages'][langName]['advance']['Quiz3'],
                              'level': 'advance',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Quiz 3: ',
                              style: k20TextStyle.copyWith(color: Colors.yellow),
                              children: [
                                TextSpan(text: 'Colors', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['advance']['Quiz1'].toString(), style: k20TextStyle), //TODO:ADD score
                        ),

                        // Greetings
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiTutGreetings;
                                break;
                              case 'English':
                                quizl = EnglishTutGreetings;
                                break;
                              case 'Spanish':
                                quizl = HindiTutNumber;
                                break;
                              case 'German':
                                quizl = HindiTutNumber;
                                break;
                              case 'French':
                                quizl = HindiTutNumber;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Module 4: Greetings',
                              'quizNo': 'Tutorial4',
                              'score': profile['languages'][langName]['advance']['Tutorial4'],
                              'level': 'advance',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Module 4: ',
                              style: k20TextStyle.copyWith(color: Colors.blueAccent),
                              children: [
                                TextSpan(text: 'Greetings', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['advance']['Tutorial4'].toString().toString(),
                              style: k20TextStyle), //TODO:ADD score
                        ),
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiQuizGreetings;
                                break;
                              case 'English':
                                quizl = EnglishQuizGreetings;
                                break;
                              case 'Spanish':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'German':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'French':
                                quizl = HindiQuizAnimals;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Quiz 4: Greetings',
                              'quizNo': 'Quiz4',
                              'score': profile['languages'][langName]['advance']['Quiz4'],
                              'level': 'advance',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Quiz 4: ',
                              style: k20TextStyle.copyWith(color: Colors.yellow),
                              children: [
                                TextSpan(text: 'Greetings', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['advance']['Quiz4'].toString(), style: k20TextStyle), //TODO:ADD score
                        ),

                        // Family Tree
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiTutFamily;
                                break;
                              case 'English':
                                quizl = EnglishTutFamily;
                                break;
                              case 'Spanish':
                                quizl = HindiTutNumber;
                                break;
                              case 'German':
                                quizl = HindiTutNumber;
                                break;
                              case 'French':
                                quizl = HindiTutNumber;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Module 5: Family',
                              'quizNo': 'Tutorial5',
                              'score': profile['languages'][langName]['beginner']['Tutorial5'],
                              'level': 'beginner',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Module 5: ',
                              style: k20TextStyle.copyWith(color: Colors.blueAccent),
                              children: [
                                TextSpan(text: 'Family Tree', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['beginner']['Tutorial5'].toString().toString(),
                              style: k20TextStyle), //TODO:ADD score
                        ),
                        ListTile(
                          onTap: () {
                            var quizl;
                            switch (langName) {
                              case 'Hindi':
                                quizl = HindiQuizFamily;
                                break;
                              case 'English':
                                quizl = EnglishQuizFamily;
                                break;
                              case 'Spanish':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'German':
                                quizl = HindiQuizAnimals;
                                break;
                              case 'French':
                                quizl = HindiQuizAnimals;
                                break;
                              default:
                                break;
                            }
                            final Map<String, dynamic> quiz = {
                              'quizList': quizl,
                              'quizName': 'Quiz 5: Family Tree',
                              'quizNo': 'Quiz5',
                              'score': profile['languages'][langName]['beginner']['Quiz5'],
                              'level': 'beginner',
                              'langName': langName
                            };
                            Navigator.pushReplacementNamed(context, QuizHandler.routeName, arguments: quiz);
                          },
                          title: RichText(
                            text: TextSpan(
                              text: 'Quiz 5: ',
                              style: k20TextStyle.copyWith(color: Colors.yellow),
                              children: [
                                TextSpan(text: 'Family Tree', style: k20TextStyle),
                              ],
                            ),
                          ),
                          trailing: Text(profile['languages'][langName]['beginner']['Quiz5'].toString(), style: k20TextStyle), //TODO:ADD score
                        ),
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

Future<DocumentSnapshot> getUserDocRef() async {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  DocumentReference userDocRef = FirebaseFirestore.instance.collection('profiles').doc(uid);
  return userDocRef.get();
}

const k20TextStyle = TextStyle(
  fontFamily: 'Poppins',
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.w500,
);
