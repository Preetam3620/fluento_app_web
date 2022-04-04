import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'LanguagePage.dart';

class leaderBoard extends StatefulWidget {
  static const routeName = '/leaderboard';
  @override
  _leaderBoardState createState() => _leaderBoardState();
}

class _leaderBoardState extends State<leaderBoard> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final _inst = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance;

  calculateScoreAndUpload() async {
    int score = 0;
    final DocumentSnapshot snapshot = await getUserDocRef();
    Map<String, dynamic> profile = snapshot.data() as Map<String, dynamic>;
    profile['languages'].forEach((k, v) {
      profile['languages'][k].forEach((i, j) {
        profile['languages'][k][i].forEach((m, n) {
          score = score + int.parse(n.toString());
        });
      });
    });
    await _inst.collection('leaderboard').doc(user.currentUser!.uid).set({'username': profile['userName'], 'score': score});
  }

  late List list;
  Future<QuerySnapshot> getLeaderboard() async {
    final snap = await _inst.collection('leaderboard').orderBy('score', descending: true).get();
    return snap;
  }

  @override
  void initState() {
    calculateScoreAndUpload();
    getLeaderboard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF2A2A44),
        automaticallyImplyLeading: true,
        title: Text(
          'Leaderboard',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFF1A1A2F),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Color(0xFF353555),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rank',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Name',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          'Score',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 100,
                decoration: BoxDecoration(
                  color: Color(0xFF2A2A44),
                  border: Border.all(
                    color: Color(0xFF1A1A2F),
                  ),
                ),
                child: FutureBuilder<QuerySnapshot>(
                    future: getLeaderboard(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center();
                      } else {
                        int index = 0;
                        return ListView(
                          shrinkWrap: true,
                          children: snapshot.data!.docs.map((DocumentSnapshot doc) {
                            Map<String, dynamic> userData = doc.data()! as Map<String, dynamic>;
                            return ListItem(index: ++index, name: userData['username'], score: userData['score']);
                          }).toList(),
                        );
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.index, required this.score, required this.name}) : super(key: key);
  final int index;
  final int score;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: Color(0xFF353555),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              index.toString(),
              // '0',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            Text(
              score.toString(),
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
