import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class WelcomePage extends StatefulWidget {
  static const routeName = '/WelcomePage';
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2F),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(color: Color(0xFF1A1A2F)),
              ),
            ),
            Expanded(
              flex: 7,
              child: Hero(
                tag: 'Logo',
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1A1A2F),
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage('assets/icons/app_logo.png'),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 12,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0xFF1A1A2F),
                ),
                child: const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
                  child: Text(
                    'Learn new languages for free.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFFC2C2C2),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GestureDetector(
                // onTap: () => Navigator.pushNamed(context, SignUpPage1.routeName),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(color: Color(0xFF1A1A2F)),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: const Color(0xFF373768),
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: const Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: AutoSizeText(
                          'Get Started.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                          ),
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
                decoration: const BoxDecoration(
                  color: Color(0xFF1A1A2F),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GestureDetector(
                // onTap: () => Navigator.pushNamed(context, SignInPage.routeName),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1A1A2F),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: const Color(0xFFD4D2D2),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: AutoSizeText(
                          'Already have an account?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFF373768),
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                          ),
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
