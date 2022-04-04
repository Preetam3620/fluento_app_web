import "package:flutter/material.dart";
import 'package:sizer/sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class addFriendsCard extends StatelessWidget {
  static const routeName = '/addFriendsCard';

  get textController => null;
  var _uid;

  getuid() {
    _uid = FirebaseAuth.instance.currentUser!.uid;
  }

  sendrequest(username) async {
    var doc_ref = await FirebaseFirestore.instance.collection("profiles").where('userName', isEqualTo: username).get();
    print(doc_ref.docs[0].id);
    if (_uid != Null) {
      await FirebaseFirestore.instance.collection("profiles").doc(doc_ref.docs[0].id).update({
        'request': FieldValue.arrayUnion([_uid])
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1A1A2F),
      padding: const EdgeInsets.fromLTRB(20, 220, 20, 220),
      child: Hero(
        tag: 'addFriend',
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Color(0xFF262647),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Enter friend\'s Username',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 23,
                  ),
                ),
                TextFormField(
                  controller: textController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: '  Username',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF6C63FF),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF6C63FF),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(
                      Icons.face,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.start,
                ),
                GestureDetector(
                  onTap: () {
                    print('tapped');
                    getuid();
                    sendrequest(textController);
                  },
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
                    child: Container(
                      child: Center(
                        child: Text(
                          'Add',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      width: 30,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1A2F),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
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
