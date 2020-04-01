import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SpeakersScreen extends StatefulWidget {
  @override
  _SpeakersScreenState createState() => _SpeakersScreenState();
}

class _SpeakersScreenState extends State<SpeakersScreen> {
  VideoPlayerController _controller;

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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Color(0xFF030D18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                color: Color(0xFF030D18),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: _controller.value.initialized
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            )
                          : Container(),
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
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'FAQ',
                  style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 2,
                    fontFamily: 'SFProTextSemibold',
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'What\'s the cost of the hackathon?'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 2,
                    fontFamily: 'SFProDisplayMed',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'DEVSOC20 is completely free thanks to our sponsors! We\'ll also provide you with enough swags, drinks, meals throughout the hackathon.',
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 2,
                    fontFamily: 'SFProDisplayLight',
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'What\'s the application process like?'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 2,
                    fontFamily: 'SFProDisplayMed',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'You\'re required to register with us on Devfolio where you\'ll be asked for basic details and your resume. We’ll get to know about your abilities from your past projects, GitHub profile, participation/awards in other hackathons. We\'ll shortlist teams for the offline hackathon round through this.',
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 2,
                    fontFamily: 'SFProDisplayLight',
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'I\'m a fresher and I don\'t have a good resume. Will I be selected?'
                      .toUpperCase(),
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 2,
                    fontFamily: 'SFProDisplayMed',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'We will be evaluating everyone based on different metrics. We\'ll take into account if you\'re a fresher and where you stand amongst your peers. If you don\'t have anything technical to add to your resume, feel free to add any public speaking events or other competitions you\'ve been to.',
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 2,
                    fontFamily: 'SFProDisplayLight',
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'What is the venue for the hackathon?'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 2,
                    fontFamily: 'SFProDisplayMed',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'First Phase of the Hackathon is Online that is resume submission. Main event which is from 16th March will be conducted in Anna Auditorium, VIT Vellore.',
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 2,
                    fontFamily: 'SFProDisplayLight',
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Can I participate alone?'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 2,
                    fontFamily: 'SFProDisplayMed',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'No! This hackathon is strictly a team competition where you can have 2-5 members in your team. Most teams aim to have a mix of people with both design and developer skills.',
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 2,
                    fontFamily: 'SFProDisplayLight',
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Do I need to have specific qualifications to be a part of the hack?'
                      .toUpperCase(),
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 2,
                    fontFamily: 'SFProDisplayMed',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'If you love to code, you\'re more than welcome to participate in the hackathon.',
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 2,
                    fontFamily: 'SFProDisplayLight',
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Does my whole team need to be present at the venue?'
                      .toUpperCase(),
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 2,
                    fontFamily: 'SFProDisplayMed',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'It\'s not mandatory for the whole team to be there all the time but atleast one member should be present during every pitch. The whole team needs to be present for the final pitch.',
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 2,
                    fontFamily: 'SFProDisplayLight',
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
