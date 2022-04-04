import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'AddFriends.dart';

class FriendsPage extends StatefulWidget {
  static const routeName = '/FriendsPage';

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF373768),
        automaticallyImplyLeading: true,
        title: Text(
          'Friends',
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
      body: Container(
        height: 13.h,
        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Color(0xFF262647),
          elevation: 4,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.width * 0.15,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://picsum.photos/seed/372/600',
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                  child: Text(
                    'Preetam Maske',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  '100',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print('FloatingActionButton pressed ...');
          Navigator.pushNamed(context, addFriendsCard.routeName);
        },
        heroTag: 'frndtag',
        backgroundColor: Color(0xFF6C63FF),
        label: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 24,
              ),
            ),
            Text(
              'Add Friends',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
