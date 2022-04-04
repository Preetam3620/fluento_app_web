import 'package:fluento_app_web/Screens/CongratulationPage.dart';

import '/Screens/LanguagePage.dart';
import '/Screens/Question/quiz_handler.dart';
import '/Screens/Question/screens/BeginnerScreens/4OpsImg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TOpsImg extends StatefulWidget {
  final String title;
  final String questionText;
  final String imageString;
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;
  final String answer;
  final int quesNo;
  final int length;
  final String langName;
  final String level;
  final String quizNo;

  TOpsImg({
    required this.title,
    required this.questionText,
    required this.imageString,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.answer,
    required this.quesNo,
    required this.length,
    required this.langName,
    required this.level,
    required this.quizNo,
  });
  @override
  _TOpsImgState createState() => _TOpsImgState();
  static const routeName = '/TOpsImg';
}

class _TOpsImgState extends State<TOpsImg> {
  bool isA = false;
  bool isB = false;
  bool isC = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF2A2A44),
        automaticallyImplyLeading: true,
        title: Text(
          widget.title,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFF1A1A2F),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Question No
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFF1A1A2F),
                      border: Border.all(
                        color: Color(0xFF1A1A2F),
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(-0.95, -0.75),
                      child: Text(
                        'Question ${widget.quesNo}:',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Question Text
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFF1A1A2F),
                      border: Border.all(
                        color: Color(0xFF1A1A2F),
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(-0.9, -0.75),
                      child: Text(
                        widget.questionText,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Question Image
              Expanded(
                flex: 6,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFF1A1A2F),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      widget.imageString,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.25,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFF1A1A2F),
                  ),
                ),
              ),

              // Option A
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (widget.optionA == widget.answer) isA = true;
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: isA ? Colors.green : Color(0xFF1A1A2F),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xFF2A2A44),
                          width: 5,
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0.1),
                        child: Text(
                          widget.optionA,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: isA ? Colors.black : Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Option B
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (widget.optionB == widget.answer) isB = true;
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: isB ? Colors.green : Color(0xFF1A1A2F),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xFF2A2A44),
                          width: 5,
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0.1),
                        child: Text(
                          widget.optionB,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: isB ? Colors.black : Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Option C
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (widget.optionC == widget.answer) isC = true;
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: isC ? Colors.green : Color(0xFF1A1A2F),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xFF2A2A44),
                          width: 5,
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0.1),
                        child: Text(
                          widget.optionC,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: isC ? Colors.black : Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFF1A1A2F),
                  ),
                ),
              ),

              // Next Button
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () async {
                    if (widget.quesNo == widget.length) {
                      if (isA == true || isB == true || isC == true) {
                        score += 1;
                        print(score);
                      }
                      await updateScrore(score: score, langName: widget.langName, title: widget.quizNo, level: widget.level);
                      //Navigator.pushReplacementNamed(context, LanguagePage.routeName, arguments: widget.langName);
                      final Map<String, dynamic> info = {'title': widget.title, 'score': score, 'langName': widget.langName, 'length': widget.quesNo};
                      Navigator.pushReplacementNamed(context, CongratulationPage.routeName, arguments: info);
                      score = 0;
                      currentPage = 0;
                    } else {
                      if (isA == true || isB == true || isC == true) {
                        score += 1;
                        print(score);
                      }
                      increasePageView();
                    }
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFF6C63FF),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Color(0xFF2A2A44),
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, -0.15),
                      child: Text(
                        'Next',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
