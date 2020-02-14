import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './screens/verify_screen.dart';
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
        builder: (ctx, auth, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
              textTheme: TextTheme(
                headline1: TextStyle(
                  fontSize: 30,
                  letterSpacing: 2,
                  fontFamily: 'SFProTextSemibold',
                ),
              ),
            ),
            home: FutureBuilder(
              future: auth.isAuth,
              builder: (ctx, resultSnapshot) {
                if (resultSnapshot.connectionState == ConnectionState.waiting) {
                  return AuthLoader();
                } else {
                  if (resultSnapshot.data) {
                    return FutureBuilder(
                      future: auth.isVerified,
                      builder: (ctx, res) {
                        if (res.connectionState == ConnectionState.waiting) {
                          return AuthLoader();
                        } else {
                          if (res.data) {
                            return TabsScreen();
                          } else {
                            return VerifyScreen();
                          }
                        }
                      },
                    );
                  } else {
                    return LoginScreen();
                  }
                }
              },
            ),
            // home: auth.isAuth
            //     ? TabsScreen()
            //     // ? FutureBuilder(
            //     //     future: auth.isVerified,
            //     //     builder: (ctx, res) {
            //     //       print(res);
            //     //       if (res.connectionState == ConnectionState.waiting) {
            //     //         return AuthLoader();
            //     //       } else {
            //     //         if (res.data) {
            //     //           return TabsScreen();
            //     //         } else {
            //     //           return VerifyScreen();
            //     //         }
            //     //       }
            //     //     },
            //     //   )
            //     : LoginScreen(),
          );
        },
      ),
    );
  }
}
