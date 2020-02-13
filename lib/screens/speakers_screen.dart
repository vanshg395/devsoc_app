import 'package:flutter/material.dart';

class SpeakersScreen extends StatelessWidget {
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
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        'assets/img/others/start.gif',
                        height: 500,
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
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'FAQ',
                  style: TextStyle(
                    fontSize: 26,
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
                  'WHAT IS THE VENUE OF THE HACKATHON?',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2,
                    fontFamily: 'SFProTextSemibold',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'First Phase of the Hackathon is Online that is idea submission. Main event which is from 16th March will be conducted in Anna Auditorium, VIT Vellore.',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2,
                    fontFamily: 'SFProTextSemibold',
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
                  'IS IT NECESSARY FOR THE WHOLE TO BE PRESENT ALL THE TIME?',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2,
                    fontFamily: 'SFProTextSemibold',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'No, not necessarily, but atleast one member should be present while pitching.',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2,
                    fontFamily: 'SFProTextSemibold',
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
                  'DO I NEED TO HAVE SPECIFIC QUALIFICATIONS TO BE PART OF THE HACKATHON?',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2,
                    fontFamily: 'SFProTextSemibold',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'If you love to code, you\'re more than welcome to participate in the Hackathon.',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2,
                    fontFamily: 'SFProTextSemibold',
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
                  'WHAT IS THE COST OF THE HACKATHON?',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2,
                    fontFamily: 'SFProTextSemibold',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'There is no registration fee for the Hackathon. It is absolutely free.',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2,
                    fontFamily: 'SFProTextSemibold',
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
