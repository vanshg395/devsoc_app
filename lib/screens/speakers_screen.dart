import 'package:flutter/material.dart';

class SpeakersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // padding: EdgeInsets.symmetric(
        //   horizontal: 20,
        // ),
        color: Color(0xFF030D18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      'assets/img/others/start.gif',
                      // fit: BoxFit.fitWidth,
                      height: 500,
                      // width: 100,
                    ),
                  ),
                  LayoutBuilder(
                    builder: (ctx, cons) => Container(
                      height: cons.maxHeight,
                      width: cons.maxWidth,
                      decoration: BoxDecoration(
                        color: Color(0x55000000),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 30,
                    ),
                    child: Text(
                      'SPEAKERS',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
