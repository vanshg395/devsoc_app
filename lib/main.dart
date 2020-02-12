import 'package:devsoc_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 30,
            letterSpacing: 5,
            fontFamily: 'SFProTextSemibold',
          ),
        ),
      ),
      home: TabsScreen(),
    );
  }
}
