import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:devsoc_app/models/HttpException.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth with ChangeNotifier {
  String _userId;
  String _email;
  final _auth = FirebaseAuth.instance;
  FirebaseUser _user;

  static const API_KEY = 'AIzaSyDyPS3MCX9ju0CcdAghaW3JAcb5Js5NI9A';

  Future<bool> get isAuth async {
    final _user = await user;
    return _user != null;
  }

  String get email {
    return _email;
  }

  String get name {
    return _userId;
  }

  Future<bool> get isVerified async {
    final usr = await _auth.currentUser();
    return usr.isEmailVerified;
  }

  Future<FirebaseUser> get user async {
    _user = await _auth.currentUser();
    return _user;
  }

  Future<void> sendEmail() async {
    final usr = await user;
    await usr.sendEmailVerification();
  }

  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    _email = extractedUserData['email'];
    _userId = extractedUserData['userId'];
  }

  Future<void> signUp(String email, String password) async {
    final res = await http.get('https://devsoc2020.firebaseio.com/users.json');
    final allowedUsers = json.decode(res.body) as Map<String, dynamic>;
    final checkEmail = email.replaceAll('.', '_');
    try {
      if (allowedUsers.keys.toList().contains(checkEmail)) {
        try {
          final newUser = await _auth.createUserWithEmailAndPassword(
              email: email, password: password);
          if (newUser != null) {
            final dbEmail = email.replaceAll('.', '_');
            await http.put(
              'https://devsoc2020.firebaseio.com/food/$dbEmail.json',
              body: json.encode(0),
            );
            final allowedUsers = json.decode(res.body) as Map<String, dynamic>;
            final checkEmail = email.replaceAll('.', '_');
            _userId = allowedUsers[checkEmail]['Name'];
            _user = await _auth.currentUser();
            _email = _user.email;
            notifyListeners();
            await sendEmail();
            final prefs = await SharedPreferences.getInstance();
            final userData = json.encode(
              {
                'email': email,
                'userId': _userId,
              },
            );
            prefs.setString('userData', userData);
          }
        } catch (e) {
          throw e;
        }
      } else {
        throw HttpException('Not Authorised');
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final signedInUser = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (signedInUser != null) {
        _user = await _auth.currentUser();
        _email = _user.email;
        final res =
            await http.get('https://devsoc2020.firebaseio.com/users.json');
        final allowedUsers = json.decode(res.body) as Map<String, dynamic>;
        final checkEmail = email.replaceAll('.', '_');
        _userId = allowedUsers[checkEmail]['Name'];
        notifyListeners();
        final prefs = await SharedPreferences.getInstance();
        final userData = json.encode(
          {
            'email': email,
            'userId': _userId,
          },
        );
        prefs.setString('userData', userData);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    _email = null;
    _userId = null;
    _user = null;
    notifyListeners();
  }
}
