import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sizer/sizer.dart';

//import '../home_page.dart';

class SignUpPage3 extends StatefulWidget {
  // SignUpPage3({required Key key}) : super(key: key);
  static const routeName = '/SignUpPage3';

  const SignUpPage3({Key? key}) : super(key: key);

  @override
  _SignUpPage3State createState() => _SignUpPage3State();
}

class _SignUpPage3State extends State<SignUpPage3> with TickerProviderStateMixin {
  late TextEditingController textController1;
  late TextEditingController textController2;
  late bool passwordVisibility;
  final bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
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
                          'assets/images/password.svg',
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
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
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
                            Icons.lock_sharp,
                            color: Color(0xFF6C63FF),
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                        keyboardType: TextInputType.visiblePassword,
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
                        obscureText: !passwordVisibility,
                        decoration: InputDecoration(
                          hintText: 'Confirm password',
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
                            Icons.lock_sharp,
                            color: Color(0xFF6C63FF),
                          ),
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => passwordVisibility = !passwordVisibility,
                            ),
                            child: Icon(
                              passwordVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                              color: const Color(0xFF757575),
                              size: 22,
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: GestureDetector(
                    onTap: () async {
                      await signUp(
                        username: user['username'],
                        emailID: user['email'],
                        password: textController1.text,
                      );
                      //Navigator.pushNamed(context, HomePage.routeName);
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

Future<void> signUp({required username, required emailID, required password}) async {
  final _auth = FirebaseAuth.instance;
  try {
    await _auth.createUserWithEmailAndPassword(
      email: emailID,
      password: password,
    ); // creating user
    print('Signed Up successfully');
  } catch (e) {
    print(e);
  }
  final User user = _auth.currentUser!;
  CollectionReference users = FirebaseFirestore.instance.collection('profiles');
  users
      .doc(user.uid)
      .set({
        'userName': username,
        'email': emailID,
        'languages': [],
        'profileImageURL': 'https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png',
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}
