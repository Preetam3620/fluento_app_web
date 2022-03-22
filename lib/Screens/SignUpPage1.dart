import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:fluento_app_web/Screens/SignUpPage2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpPage1 extends StatefulWidget {
  static const routeName = '/SignUpPage1';
  const SignUpPage1({Key? key}) : super(key: key);

  @override
  _SignUpPage1State createState() => _SignUpPage1State();
}

class _SignUpPage1State extends State<SignUpPage1> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFF1A1A2F),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0xFF1A1A2F),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Hero(
                  tag: 'Logo',
                  child: Container(
                    child: SvgPicture.asset(
                      'assets/images/email.svg',
                      fit: BoxFit.contain,
                      width: 100,
                      height: 100,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFF1A1A2F),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0xFF1A1A2F),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0xFF1A1A2F),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, SignUpPage2.routeName),
                    child: Container(
                      width: 130,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF373768),
                        border: Border.all(
                          color: const Color(0xFF373768),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.email,
                            size: 30,
                            color: Color(0xFFC2C2C2),
                          ),
                          SizedBox(width: 20),
                          AutoSizeText(
                            'Sign Up with email',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFFC2C2C2),
                              fontSize: 21,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0xFF1A1A2F),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0xFF1A1A2F),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: GestureDetector(
                    onTap: () {
                      print('Button pressed ...');
                    },
                    child: Container(
                      width: 130,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF373768),
                        border: Border.all(
                          color: const Color(0xFF373768),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.google,
                            color: Color(0xFFC2C2C2),
                          ),
                          SizedBox(width: 20),
                          AutoSizeText(
                            'Sign Up with Google',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFFC2C2C2),
                              fontSize: 21,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0xFF1A1A2F),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
