import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class EssentialsScreen extends StatelessWidget {
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
                      'PARTICIPANT',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('QR CODE'),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: QrImage(
                      padding: EdgeInsets.all(30),
                      data: 'vanshg395@gmail.com',
                      backgroundColor: Color(0xFF072031),
                      foregroundColor: Colors.white,
                      embeddedImage:
                          AssetImage('assets/img/others/devsoc_shadow.png'),
                    ),
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
