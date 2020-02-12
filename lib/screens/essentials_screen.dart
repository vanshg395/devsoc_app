import 'package:flutter/material.dart';

class EssentialsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Color(0xFF030D18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                'ESSENTIALS',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/img/others/map.png',
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 30,
            ),
            Text('MY INFO'),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 80,
              // alignment: Alignment.centerLeft,
              child: Card(
                color: Color(0xFF072031),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.cyan,
                    child: Text(
                      'VG',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text('VANSH GOEL'),
                  subtitle: Text(
                    'Participant',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('QR CODE'),
          ],
        ),
      ),
    );
  }
}
