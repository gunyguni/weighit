import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weighit/models/user_info.dart';
import 'package:weighit/screens/body_status/status.dart';
import 'package:weighit/screens/camera/camera.dart';
import 'package:weighit/screens/home/home_card_tile.dart';
import 'package:weighit/screens/make_routine.dart';
import 'package:weighit/screens/test/test.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _children = [CardTile(), CameraScreen(), Status(), Test()];
  @override
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: size.height * 0.1,
        child: BottomNavigationBar(
          backgroundColor: Color(0xffF8F7F7),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme
              .of(context)
              .accentColor,
          unselectedItemColor: Color(0xff878787),
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_outlined),
              label: '내 몸 어때?',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.accessibility),
              label: '내 상태는?',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_awesome_mosaic),
              label: '내 능력은?',
            ),
          ],
        ),
      ),
      body: _children[_selectedIndex],
    );
  }
}