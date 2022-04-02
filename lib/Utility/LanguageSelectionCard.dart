import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class SelectLanguageCard extends StatefulWidget {
  static const routeName = '/SelectLanguageCard';

  const SelectLanguageCard({Key? key}) : super(key: key);

  @override
  _SelectLanguageCardState createState() => _SelectLanguageCardState();
}

class _SelectLanguageCardState extends State<SelectLanguageCard> {
  late String lang = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2F),
      body: SafeArea(
        child: Hero(
          tag: 'addLang',
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: const BoxDecoration(
              color: Color(0xFF1A1A2F),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 40, 20, 40),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: const Color(0xFF373768),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // select language
                    Expanded(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Color(0xFF373768),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Select a language',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    lang = '';
                                  });
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // hindi
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            lang = 'Hindi';
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 15),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: lang == 'Hindi' ? const Color(0XFF6C63FF) : const Color(0xFF373768),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFF6C63FF),
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/images/Hindi.svg',
                                        fit: BoxFit.scaleDown,
                                        width: 50,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                    child: Text(
                                      'Hindi',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const Spacer()
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // english
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            lang = 'English';
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 15),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: lang == 'English' ? const Color(0XFF6C63FF) : const Color(0xFF373768),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFF6C63FF),
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-0.85, 0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                                      child: Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/images/English.svg',
                                          fit: BoxFit.scaleDown,
                                          width: 50,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                    child: Text(
                                      'English',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // spanish
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            lang = 'Spanish';
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 15),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: lang == 'Spanish' ? const Color(0XFF6C63FF) : const Color(0xFF373768),
                              border: Border.all(
                                color: const Color(0xFF6C63FF),
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-0.85, 0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                                      child: Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/images/Spanish.svg',
                                          fit: BoxFit.scaleDown,
                                          width: 50.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                    child: Text(
                                      'Spanish',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Spacer()
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // french
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            lang = 'French';
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 15),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: lang == 'French' ? const Color(0XFF6C63FF) : const Color(0xFF373768),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFF6C63FF),
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-0.85, 0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                                      child: Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/images/French.svg',
                                          fit: BoxFit.scaleDown,
                                          width: 50,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                    child: Text(
                                      'French',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // german
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            lang = 'German';
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 15),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: lang == 'German' ? const Color(0XFF6C63FF) : const Color(0xFF373768),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFF6C63FF),
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-0.85, 0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                                      child: Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/images/German.svg',
                                          fit: BoxFit.scaleDown,
                                          width: 50,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                    child: Text(
                                      'German',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Done
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 15),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFF373768),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xFF373768),
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(220, 1.h, 20, 1.h),
                            child: GestureDetector(
                              onTap: () async {
                                await addLanguage(langName: lang);
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 130,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF6C63FF),
                                  border: Border.all(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Done',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
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
          ),
        ),
      ),
    );
  }
}

Future<void> addLanguage({required langName}) async {
  Map<String, int> beginnerMap = {
    'Tutorial1': 0,
    'Quiz1': 0,
    'Tutorial2': 0,
    'Quiz2': 0,
    'Tutorial3': 0,
    'Quiz3': 0,
    'Tutorial4': 0,
    'Quiz4': 0,
    'Tutorial5': 0,
    'Quiz5': 0,
  };
  Map<String, int> intermediateMap = {
    'Tutorial1': 0,
    'Quiz1': 0,
    'Tutorial2': 0,
    'Quiz2': 0,
    'Tutorial3': 0,
    'Quiz3': 0,
    'Tutorial4': 0,
    'Quiz4': 0,
    'Tutorial5': 0,
    'Quiz5': 0,
  };
  Map<String, int> advanceMap = {
    'Tutorial1': 0,
    'Quiz1': 0,
    'Tutorial2': 0,
    'Quiz2': 0,
    'Tutorial3': 0,
    'Quiz3': 0,
    'Tutorial4': 0,
    'Quiz4': 0,
    'Tutorial5': 0,
    'Quiz5': 0,
  };

  Map<String, dynamic> langNameMap = {
    'beginner': beginnerMap,
    'intermediate': intermediateMap,
    'advance': advanceMap,
  };

  Map<String, dynamic> language = {langName: langNameMap};

  final uid = FirebaseAuth.instance.currentUser!.uid;
  DocumentReference user = FirebaseFirestore.instance.collection('profiles').doc(uid);
  await user
      .set({
        'languages': language,
      }, SetOptions(merge: true))
      .then((value) => print("Language Added"))
      .catchError((error) => print("Failed to add language: $error"));
}
