import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './screens/auth_loader.dart';
import './screens/tabs_screen.dart';
import './screens/login_screen.dart';
import './providers/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return ChangeNotifierProvider.value(
      value: Auth(),
      child: Consumer<Auth>(
        builder: (context, auth, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
              textTheme: TextTheme(
                headline1: TextStyle(
                  fontSize: 30,
                  letterSpacing: 5,
                  fontFamily: 'SFProTextSemibold',
                ),
              ),
            ),
            home: auth.isAuth
                ? TabsScreen()
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: (context, authResultSnapshot) =>
                        authResultSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? AuthLoader()
                            : LoginScreen(),
                  ),
          );
        },
      ),
    );
  }
}
