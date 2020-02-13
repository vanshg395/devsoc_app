import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

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
                          children: <Widget>[
                            Text(
                              'A verification mail has been sent to your email.',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(
                                    fontSize: 18,
                                    letterSpacing: 0,
                                  ),
                            ),
                            Divider(
                              thickness: 2,
                              color: Colors.grey,
                            ),
                            InkWell(
                              child: Text(
                                'Didn\'t receive email? Click Here.',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                      fontSize: 18,
                                      letterSpacing: 0,
                                    ),
                              ),
                              onTap: () async {
                                await showDialog(
                                  context: context,
                                  builder: (context) => CupertinoAlertDialog(
                                    title: Text('Success'),
                                    content: Text(
                                        'Validation Mail has been re-sent to your mail'),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('OK'),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      )
                                    ],
                                  ),
                                );
                                await Provider.of<Auth>(context, listen: false)
                                    .sendEmail();
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: RaisedButton(
                                  color: Color(0xFFFE2851),
                                  textColor: Colors.white,
                                  child: Text(
                                    'GET STARTED',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  onPressed: () async {
                                    await Provider.of<Auth>(context,
                                            listen: false)
                                        .logout();
                                  },
                                ),
                              ),
                            ),
                          ],
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
