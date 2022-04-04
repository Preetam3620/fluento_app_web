import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class requestPage extends StatefulWidget {
  static const routeName = '/RequestsPage';
  @override
  _requestPageState createState() => _requestPageState();
}

class _requestPageState extends State<requestPage> {
  final Stream<DocumentSnapshot<Map<String, dynamic>>> _profileinfo =
      FirebaseFirestore.instance.collection('profiles').doc(FirebaseAuth.instance.currentUser!.uid).snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF373768),
        automaticallyImplyLeading: true,
        title: Text(
          'Requests',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFF1A1A2F),
    );
  }
}
