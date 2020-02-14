import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import './signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool visisblePassword = false;
  bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  String errorMessage = '';

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
      await Provider.of<Auth>(context, listen: false).login(email, password);
    } catch (error) {
      if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('ERROR_USER_NOT_FOUND')) {
        errorMessage =
            'There is no user record corresponding to this identifier.';
      } else if (error.toString().contains('ERROR_WRONG_PASSWORD')) {
        errorMessage =
            'The password is invalid or the user does not have a password.';
      } else if (error.toString().contains('Not Authorised')) {
        errorMessage = 'This email is not registered with us.';
      } else if (error.toString().contains('TOO_MANY_ATTEMPTS_TRY_LATER')) {
        errorMessage =
            'Too many unsuccessful login attempts. Please try again later.';
      } else {
        errorMessage = 'Could not authenticate you. Please try again later.';
      }
      showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text('Authentication Error'),
          content: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(errorMessage),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      );
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
            // Image.asset(
            //   'assets/img/others/start.gif',
            //   fit: BoxFit.cover,
            //   height: double.infinity,
            //   width: double.infinity,
            // ),
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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.white),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
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
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
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
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: _isLoading
                                      ? Center(
                                          child: CircularProgressIndicator(
                                            valueColor: AlwaysStoppedAnimation(
                                              Colors.blue,
                                            ),
                                          ),
                                        )
                                      : RaisedButton(
                                          color: Colors.blue,
                                          textColor: Colors.white,
                                          child: Text(
                                            'SIGN IN',
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
                                textColor: Colors.white,
                                child: Text('New User? Register Here'),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (ctx) => SignupScreen(),
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
      ),
    );
  }
}
