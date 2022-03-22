//import 'package:fluento_app/Screens/SignUp/signup_page3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'SignUpPage3.dart';

class SignUpPage2 extends StatefulWidget {
  static const routeName = '/SignUpPage2';
  const SignUpPage2({Key? key}) : super(key: key);

  @override
  _SignUpPage2State createState() => _SignUpPage2State();
}

class _SignUpPage2State extends State<SignUpPage2> with TickerProviderStateMixin {
  late TextEditingController textController1;
  late TextEditingController textController2;
  final bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF1A1A2F),
        body: SingleChildScrollView(
          child: SizedBox(
            height: 100.h,
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
                  flex: 5,
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
                      child: TextFormField(
                        controller: textController1,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF6C63FF),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF6C63FF),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: const Color(0xFF373768),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Color(0xFF6C63FF),
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                        keyboardType: TextInputType.name,
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
                      child: TextFormField(
                        controller: textController2,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Email ID',
                          hintStyle: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF6C63FF),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF6C63FF),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: const Color(0xFF373768),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Color(0xFF6C63FF),
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: GestureDetector(
                    onTap: () {
                      final user = {
                        'username': textController1.text,
                        'email': textController2.text,
                      };
                      Navigator.pushNamed(context, SignUpPage3.routeName, arguments: user);
                    },
                    child: Hero(
                      tag: 'but',
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1A1A2F),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(220, 30, 20, 30),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Next',
                                  style: TextStyle(fontFamily: 'Poppins', color: Colors.white, fontSize: 18),
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ],
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
    );
  }
}
