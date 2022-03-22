import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

//import '../home_page.dart';

class SignInPage extends StatefulWidget {
  static const routeName = '/SignInPage';

  const SignInPage({Key? key}) : super(key: key);
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController textController1;
  late TextEditingController textController2;
  late bool passwordVisibility;

  final _auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SafeArea(
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
                    flex: 3,
                    child: Hero(
                      tag: "Logo",
                      child: Container(
                        child: SvgPicture.asset(
                          'assets/images/SignUp.svg',
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
                    flex: 1,
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
                            hintText: 'Email Id',
                            hintStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFF6C63FF),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFF6C63FF),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Color(0xFF6C63FF),
                            ),
                          ),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          keyboardType: TextInputType.emailAddress,
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
                      child: Align(
                        alignment: const AlignmentDirectional(0, -1),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: TextFormField(
                            controller: textController2,
                            obscureText: !passwordVisibility,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFF6C63FF),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFF6C63FF),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
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
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Field is required';
                              }

                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Sign In with email
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1A1A2F),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF1A1A2F),
                          )
                        ],
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: SizedBox(
                          width: 230,
                          height: 44,
                          child: GestureDetector(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                final email = textController1.text;
                                final password = textController2.text;
                                final String message = await signIn(emailID: email, password: password);
                                //final User user = _auth.currentUser!;
                                if (message[0] == 'L') {
                                  //Navigator.pushNamed(context, HomePage.routeName);
                                } else if (message[0] == 'N') {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
                                } else if (message[0] == 'W') {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF1A1A2F),
                                border: Border.all(
                                  color: const Color(0xFF6C63FF),
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 22,
                                    height: 22,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.email,
                                      color: Color(0xFF6C63FF),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Sign in with Email',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Sign In with google
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1A1A2F),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF1A1A2F),
                          )
                        ],
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: SizedBox(
                          width: 230,
                          height: 44,
                          child: GestureDetector(
                            onTap: () {
                              // print('Button pressed ...');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF1A1A2F),
                                border: Border.all(
                                  color: const Color(0xFF6C63FF),
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 22,
                                    height: 22,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Sign in with Google',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1A1A2F),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<String> signIn({required emailID, required password}) async {
  final _auth = FirebaseAuth.instance;
  try {
    await _auth.signInWithEmailAndPassword(
      email: emailID,
      password: password,
    );
    return 'Logged in';
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      return 'Wrong password provided for that user.';
    }
  }
  print("SignIn>>>>>>>>${_auth.currentUser!.uid}");
  return '';
}
