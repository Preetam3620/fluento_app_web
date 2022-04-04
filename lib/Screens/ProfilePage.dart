import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profilepage';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        // leading: Icon(
        //   Icons.arrow_back,
        //   color: Color(0xFFF5F5F5),
        //   size: 28,
        // ),
        backgroundColor: Color(0xFF373768),
        automaticallyImplyLeading: true,
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Text(
            'Profile',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFFF5F5F5),
              fontSize: 26,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: Icon(
              Icons.edit_sharp,
              color: Color(0xFFF5F5F5),
              size: 28,
            ),
          )
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFF1A1A2F),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(flex: 2),
            Expanded(
              flex: 5,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFF1A1A2F),
                ),
                child: Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://picsum.photos/seed/58/600',
                  ),
                ),
              ),
            ),
            Spacer(flex: 2),
            Expanded(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFF1A1A2F),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 15, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: Icon(
                          Icons.face,
                          color: Color(0xFF6C63FF),
                          size: 35,
                        ),
                      ),
                      Flexible(
                        child: Container(
                          child: Text(
                            'Preetam Maske',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFFF5F5F5),
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Expanded(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFF1A1A2F),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 15, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: Icon(
                          Icons.email,
                          color: Color(0xFF6C63FF),
                          size: 35,
                        ),
                      ),
                      Flexible(
                        child: Container(
                          child: Text(
                            'PreetamMaske@gmail.com',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFFF5F5F5),
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Expanded(
              flex: 3,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFF1A1A2F),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFF6C63FF),
                          elevation: 10,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Languages',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFF5F5F5),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '20',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFF5F5F5),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFF6C63FF),
                          elevation: 10,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Account \nLevel',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFF5F5F5),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Text(
                                  '20',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFF5F5F5),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFF6C63FF),
                          elevation: 1,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Friends',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFF5F5F5),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '20',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFF5F5F5),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Spacer(flex: 2)
          ],
        ),
      ),
    );
  }
}
