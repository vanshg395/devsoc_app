import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/img/others/start.gif',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey.withOpacity(0.1),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 50.0, left: 20),
                            child: Text(
                              'DEVSOC 20',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                          Flexible(
                            child: Container(
                              height: 150,
                              padding: EdgeInsets.only(top: 20),
                              child: Image.asset(
                                'assets/img/others/devsoc_shadow.png',
                                fit: BoxFit.fitHeight,
                                // width: 100,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: <Widget>[],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
