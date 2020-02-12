import 'package:flutter/material.dart';

import '../widgets/boardList.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Color(0xFF030D18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: Text(
                  'ABOUT US',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text('OUR TEAM'),
              SizedBox(
                height: 20,
              ),
              BoardList(),
              SizedBox(
                height: 30,
              ),
              Text('SPONSORS'),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF072031),
                ),
                child: Image.asset('assets/img/others/sponsors.png'),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
