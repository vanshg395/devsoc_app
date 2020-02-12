import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import './login_screen.dart';
import '../providers/auth.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool visisblePassword = false;
  bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    final email = _authData['email'];
    final password = _authData['password'];
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Auth>(context, listen: false).signUp(email, password);
    } catch (e) {
      print(e);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF030D18),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Stack(
            children: <Widget>[
              Image.asset(
                'assets/img/others/start.gif',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                // width: 100,
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Color(0x99000000),
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
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(color: Colors.white),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (val) {
                                    if (val == '') {
                                      return 'This Field is required.';
                                    }
                                  },
                                  onSaved: (val) {
                                    _authData['email'] = val;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        visisblePassword
                                            ? FontAwesomeIcons.eye
                                            : FontAwesomeIcons.eyeSlash,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          visisblePassword = !visisblePassword;
                                        });
                                      },
                                    ),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(color: Colors.white),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  obscureText: !visisblePassword,
                                  validator: (val) {
                                    if (val == '') {
                                      return 'This Field is required.';
                                    }
                                  },
                                  onSaved: (val) {
                                    _authData['password'] = val;
                                  },
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height: 50,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: _isLoading
                                        ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : RaisedButton(
                                            child: Text(
                                              'REGISTER',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            onPressed: _submit,
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                FlatButton(
                                  child: Text('Already Registered? Login Here'),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (ctx) => LoginScreen(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
