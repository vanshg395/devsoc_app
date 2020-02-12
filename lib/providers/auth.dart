import 'dart:async';
import 'dart:convert';

import 'package:devsoc_app/models/HttpException.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  String _email;
  Timer _authTimer;

  String API_KEY = 'AIzaSyDyPS3MCX9ju0CcdAghaW3JAcb5Js5NI9A';

  bool get isAuth {
    return token != null;
  }

  String get email {
    return _email;
  }

  String get name {
    return _userId;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> signUp(String email, String password) async {
    final res = await http.get('https://devsoc2020.firebaseio.com/users.json');
    final allowedUsers = json.decode(res.body) as Map<String, dynamic>;
    final checkEmail = email.replaceAll('.', '_');
    try {
      if (allowedUsers.keys.toList().contains(checkEmail)) {
        try {
          final response = await http.post(
            'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$API_KEY',
            body: json.encode(
              {
                'email': email,
                'password': password,
                'returnSecureToken': true,
              },
            ),
          );
          final responseData = json.decode(response.body);
          if (responseData['error'] != null) {
            throw HttpException(responseData['error']['message']);
          }
          _token = responseData['idToken'];
          _userId = allowedUsers[checkEmail]['Name'];
          _email = email;
          _expiryDate = DateTime.now().add(
            Duration(
              seconds: int.parse(
                responseData['expiresIn'],
              ),
            ),
          );
          _autoLogout();
          notifyListeners();
          final prefs = await SharedPreferences.getInstance();
          final userData = json.encode(
            {
              'token': _token,
              'userId': _userId,
              'email': _email,
              'expiryDate': _expiryDate.toIso8601String(),
            },
          );
          prefs.setString('userData', userData);
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
      final response = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$API_KEY',
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      final res =
          await http.get('https://devsoc2020.firebaseio.com/users.json');
      final allowedUsers = json.decode(res.body) as Map<String, dynamic>;
      final checkEmail = email.replaceAll('.', '_');
      _userId = allowedUsers[checkEmail]['Name'];
      _email = email;
      print(_email);
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      _autoLogout();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
          'email': _email,
          'expiryDate': _expiryDate.toIso8601String(),
        },
      );
      prefs.setString('userData', userData);
    } catch (e) {
      throw e;
    }
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    _email = extractedUserData['email'];
    _expiryDate = expiryDate;
    notifyListeners();
    _autoLogout();
    return true;
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }
    final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }
}
