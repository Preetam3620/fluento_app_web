import '/Screens/Question/models/question.dart';
import '/Screens/Question/screens/BeginnerScreens/3OpsImg.dart';
import '/Screens/Question/screens/BeginnerScreens/3OpsNoImg.dart';
import '/Screens/Question/screens/BeginnerScreens/4OpsImg.dart';
import '/Screens/Question/screens/BeginnerScreens/4OpsNoImg.dart';
import 'package:flutter/material.dart';

class QuizHandler extends StatefulWidget {
  static const routeName = '/QuizHandler';

  const QuizHandler({Key? key}) : super(key: key);

  @override
  _QuizHandlerState createState() => _QuizHandlerState();
}

PageController _pageController = PageController(initialPage: 0);

int currentPage = 0;
int score = 0;

void increasePageView() {
  _pageController.animateToPage(++currentPage, duration: Duration(milliseconds: 500), curve: Curves.easeOutQuint);
}

class _QuizHandlerState extends State<QuizHandler> {
  @override
  Widget build(BuildContext context) {
    final quiz = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return PageView.builder(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      itemCount: quiz['quizList'].length,
      itemBuilder: (BuildContext context, int index) {
        final String questionType = quiz['quizList'][index].questionType;
        if (questionType == '4MI') {
          return FOpsImage(
            length: quiz['quizList'].length,
            langName: quiz['langName'],
            level: quiz['level'],
            quizNo: quiz['quizNo'],
            title: quiz['quizName'],
            imageString: quiz['quizList'][index].imageString,
            answer: quiz['quizList'][index].answer,
            questionText: quiz['quizList'][index].questionText,
            optionA: quiz['quizList'][index].optionA,
            optionB: quiz['quizList'][index].optionB,
            optionC: quiz['quizList'][index].optionC,
            optionD: quiz['quizList'][index].optionD,
            quesNo: index + 1,
          );
        } else if (questionType == '4MNI') {
          return FOpsNoImage(
            length: quiz['quizList'].length,
            langName: quiz['langName'],
            level: quiz['level'],
            quizNo: quiz['quizNo'],
            title: quiz['quizName'],
            answer: quiz['quizList'][index].answer,
            questionText: quiz['quizList'][index].questionText,
            optionA: quiz['quizList'][index].optionA,
            optionB: quiz['quizList'][index].optionB,
            optionC: quiz['quizList'][index].optionC,
            optionD: quiz['quizList'][index].optionD,
            quesNo: index + 1,
          );
        } else if (questionType == '3MI')
          return TOpsImg(
            length: quiz['quizList'].length,
            langName: quiz['langName'],
            level: quiz['level'],
            quizNo: quiz['quizNo'],
            title: quiz['quizName'],
            imageString: quiz['quizList'][index].imageString,
            answer: quiz['quizList'][index].answer,
            questionText: quiz['quizList'][index].questionText,
            optionA: quiz['quizList'][index].optionA,
            optionB: quiz['quizList'][index].optionB,
            optionC: quiz['quizList'][index].optionC,
            optionD: quiz['quizList'][index].optionD,
            quesNo: index + 1,
          );
        else if (questionType == '3MNI')
          return TOpsNoImage(
            length: quiz['quizList'].length,
            langName: quiz['langName'],
            level: quiz['level'],
            quizNo: quiz['quizNo'],
            title: quiz['quizName'],
            imageString: quiz['quizList'][index].imageString,
            answer: quiz['quizList'][index].answer,
            questionText: quiz['quizList'][index].questionText,
            optionA: quiz['quizList'][index].optionA,
            optionB: quiz['quizList'][index].optionB,
            optionC: quiz['quizList'][index].optionC,
            optionD: quiz['quizList'][index].optionD,
            quesNo: index + 1,
          );
        else
          return Container();
      },
    );
  }
}
