import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../providers/auth.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  VideoPlayerController _controller;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/img/others/back_vid.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.play();
    _controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF030D18),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            Center(
              child: _controller.value.initialized
                  ? AspectRatio(
                      aspectRatio: MediaQuery.of(context).size.width /
                          MediaQuery.of(context).size.height,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Color(0xCC14192D),
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
                            padding: EdgeInsets.only(top: 30.0, left: 20),
                            child: Row(
                              textBaseline: TextBaseline.alphabetic,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              children: <Widget>[
                                Text(
                                  'DEVSOC',
                                  style: TextStyle(
                                      fontSize: 22,
                                      textBaseline: TextBaseline.alphabetic,
                                      fontFamily: 'SFProTextSemibold'),
                                ),
                                Text(
                                  '20',
                                  style: TextStyle(
                                    fontSize: 32,
                                    textBaseline: TextBaseline.alphabetic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Container(
                              height: 100,
                              padding: EdgeInsets.only(top: 20),
                              child: Image.asset(
                                'assets/img/others/devsoc_shadow.png',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
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
                                    fontFamily: 'SFProDisplayMed',
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
                                setState(() {
                                  _isLoading = true;
                                });
                                try {
                                  await Provider.of<Auth>(context,
                                          listen: false)
                                      .sendEmail();
                                } catch (e) {}
                                setState(() {
                                  _isLoading = false;
                                });
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
                              },
                            ),
                            if (_isLoading) ...[
                              SizedBox(
                                height: 5,
                              ),
                              LinearProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                  Colors.blue,
                                ),
                              ),
                            ],
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 40,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: RaisedButton(
                                  color: Color(0xFFFE2851),
                                  textColor: Colors.white,
                                  child: Text(
                                    'GET STARTED',
                                    style: TextStyle(
                                      fontSize: 14,
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
