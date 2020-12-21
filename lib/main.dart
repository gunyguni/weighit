import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weighit/models/user_info.dart';
import 'package:weighit/services/auth.dart';
import 'package:weighit/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser>(
      create: (_) => AuthService().user,
      child: MaterialApp(
        title: 'final',
        home: Wrapper(),
        theme: defaultTheme(),
        // routes 지정
        // routes: {
        //   '/initialPage': (context) => Wrapper(),
        // },
      ),
    );
  }

  ThemeData defaultTheme() {
    return ThemeData(
      // the default brightness and colors are DEFINED HERE
      brightness: Brightness.light,
      primaryColor: Color(0xff001845),
      accentColor: Colors.cyan[600],

      // the default font family are DEFINED HERE
      // fontFamily: 'Medium',

      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 24.0, fontFamily: 'Medium'),
        headline6: TextStyle(fontSize: 20.0, fontFamily: 'Medium'),
        subtitle1: TextStyle(fontSize: 18.0, color: Colors.cyan, fontFamily: 'Medium', fontWeight: FontWeight.bold),
        subtitle2: TextStyle(fontSize: 15.0, color: Colors.white, fontFamily: 'Medium'),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Medium'),
      ),
    );
  }
}
