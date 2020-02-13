import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

class EssentialsScreen extends StatelessWidget {
  String getInitials(String name) {
    String initials = '';
    initials = name[0];
    for (var i = 0; i < name.length; i++) {
      if (name[i] == ' ') {
        initials += name[i + 1];
        break;
      }
    }
    initials = initials.toUpperCase();
    return initials;
  }

  @override
  Widget build(BuildContext context) {
    print(Provider.of<Auth>(context, listen: false).name);
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
                child: Card(
                  color: Color(0xFF072031),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.cyan,
                      child: Text(
                        getInitials(
                            Provider.of<Auth>(context, listen: false).name),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(Provider.of<Auth>(context, listen: false).name),
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
                      data: Provider.of<Auth>(context, listen: false).email,
                      backgroundColor: Color(0xFF072031),
                      foregroundColor: Colors.white,
                      embeddedImage:
                          AssetImage('assets/img/others/devsoc_shadow.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('Logout'),
                onPressed: () {
                  Provider.of<Auth>(context, listen: false).logout();
                },
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
