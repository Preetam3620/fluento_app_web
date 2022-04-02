import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluento_app/Screens/friends/friends_page.dart';
// import 'package:fluento_app/Screens/leaderboard.dart';
// import 'package:fluento_app/Screens/requestpage.dart';
import 'package:fluento_app_web/Utility/LanguageSelectionCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'LanguagePage.dart';
// import 'Language-Page/language_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final Stream<DocumentSnapshot<Map<String, dynamic>>> _profileInfo = FirebaseFirestore.instance.collection('profiles').doc(FirebaseAuth.instance.currentUser!.uid).snapshots();
  @override
  void initState() {
    super.initState();
  }

  int count(Map Mapi) {
    int cnt = 0;
    print('yo');
    print(Mapi);
    Mapi.forEach((k, v) {
      if (v != 0) cnt++;
    });

    return cnt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
        actions: [
          /*Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(' ', fit: BoxFit.cover)),
          )*/
        ],
        centerTitle: true,
        elevation: 5,
      ),
      backgroundColor: const Color(0xFF1A1A2F),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _profileInfo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Data is loading'));
          } else {
            Map<String, dynamic> profile = snapshot.data!.data() as Map<String, dynamic>;

            return (profile['languages'].length != 0)
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: profile['languages'].length, //profile['languages'].length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 30.h,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, LanguagePage.routeName, arguments: profile['languages'].keys.elementAt(index));
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: const Color(0xFF262647),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${profile['languages'].keys.elementAt(index)}',
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
                                            'assets/images/${profile['languages'].keys.elementAt(index)}.svg', //${profile['languages'][index]['languageName']}
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Divider(color: Colors.white),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Beginner',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        '${count(profile['languages'][profile['languages'].keys.elementAt(index)]['beginner'])}',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Intermediate',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        '${count(profile['languages'][profile['languages'].keys.elementAt(index)]['intermediate'])}', //${count(profile.data(['languages'][index])',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Advance',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        '${count(profile['languages'][profile['languages'].keys.elementAt(index)]['advance'])}', //${count(profile['languages'][index]['advance'])}',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'addLang',
        onPressed: () {
          Navigator.pushNamed(context, SelectLanguageCard.routeName);
        },
        backgroundColor: const Color(0xFF6C63FF),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
          size: 24,
        ),
        elevation: 8,
        label: const Text(
          'Add Language',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      drawer: Drawer(
        elevation: 16,
        child: Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            color: Color(0xFF373768),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: const BoxDecoration(
                    color: Color(0xFF373768),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Fluento\n',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 36,
                        fontStyle: FontStyle.normal,
                      ),
                    )
                  ],
                ),
                const Divider(
                  thickness: 3,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                GestureDetector(
                  //onTap: () => Navigator.pushNamed(context, FriendsPage.routeName),
                  child: const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: Text(
                      'Friends',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  //onTap: () => Navigator.pushNamed(context, requestPage.routeName),
                  child: const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: Text(
                      'Requests',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child: Text(
                    'Languages',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                GestureDetector(
                  //onTap: () => Navigator.pushNamed(context, leaderBoard.routeName),
                  child: const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: Text(
                      'Leaderboard',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child: Text(
                    'Settings',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 3,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
