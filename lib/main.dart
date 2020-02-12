import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/tabs_screen.dart';
import './screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
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
