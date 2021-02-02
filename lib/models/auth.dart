import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppState {
  loading,
  initial,
  authenticated,
  authenticating,
  unauthenticated
}

class AuthProvider with ChangeNotifier {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);
  FirebaseMessaging fm = FirebaseMessaging();
  GoogleSignInAccount _currentUser;
  Profile _profile;
  Credential _credential;
  AppState _appState;
  SharedPreferences _prefs;

  AppState get appState => _appState;
  GoogleSignInAccount get currentUser => _currentUser;
  Profile get profile => _profile;
  Credential get credential => _credential;

  //constructor
  AuthProvider() {
    _initPrefs(); //set condition initial
    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount account) async {
      if (account == null) {
        _setAppState(AppState.unauthenticated);
      } else {
        print('HARUSNYA KE DASHBOARD');
        _currentUser = account;
        fm.configure();
      }
      notifyListeners();
    });
    _googleSignIn.signInSilently();
  }

  Future _initPrefs() async {
    if (_prefs == null) {
      _appState = AppState.loading;
      notifyListeners();
      _prefs = await SharedPreferences.getInstance();
      await _loadPrefs();
    } else {
      await _loadPrefs();
    }
  }

  //call only on start of application
  Future _loadPrefs() async {
    _setAppState(_prefs.getString('appState') != null
        ? AppState.values
            .firstWhere((e) => e.toString() == _prefs.getString('appState'))
        : AppState.initial);

    //find existing credential if exist, if not set null
    _credential = _prefs.getString('credential') != null
        ? Credential.fromJson(json.decode(_prefs.getString('credential')))
        : null;
    _profile = _prefs.getString('profile') != null
        ? Profile.fromJson(json.decode(_prefs.getString('profile')))
        : null;

    await _configurePrefs();
  }

  Future<void> _configurePrefs() async {
    await _prefs.setString('appState', _appState.toString());
    if (_credential != null) {
      await _prefs.setString('credential', json.encode(_credential.toJson()));
    }
    if (_profile != null) {
      await _prefs.setString('profile', json.encode(_profile.toJson()));
    }
    notifyListeners();
  }

  Future _setAppState(AppState state) async {
    _appState = state;
    await _configurePrefs();
  }

  Future _getLoginInfo(googleToken) async {
    try {
      Response response = await Dio().post(
        env["SERVER_URL"] + "/auth",
        data: {'token': googleToken, 'fcm_token': await fm.getToken()},
      );
      _credential = Credential.convert(
          response.data['authToken'], response.data['refreshToken']);
      _profile = Profile.convert(response.data['customer']);
      await _setAppState(AppState.authenticated);
    } on DioError catch (e) {
      print("error code login : " + e.response.statusCode.toString());
      print("error login message :" + e.response.data);
    }
  }

  Future<bool> login() async {
    try {
      _setAppState(AppState
          .authenticating); //set current state to loading authenticating
      GoogleSignInAccount account = await _googleSignIn.signIn();

      if (account == null) {
        _setAppState(AppState.unauthenticated);
        return false;
      }
      GoogleSignInAuthentication authToken = await account.authentication;
      await _getLoginInfo(authToken.idToken);
      return true;
    } catch (err) {
      _setAppState(AppState.unauthenticated);
      return false;
    }
  }

  Future logout() async {
    await _googleSignIn.signOut();
    _currentUser = null;
    _credential = null;
    _profile = null;
    await _prefs.remove('profile');
    await _prefs.remove('credential');
    _setAppState(AppState.unauthenticated);
    return Future.delayed(Duration.zero);
  }
}

class Profile {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String birthday;
  final int gender;
  final String address;
  final String fcm_token;

  Profile(this.id, this.name, this.phone, this.email, this.birthday,
      this.gender, this.address, this.fcm_token);
  Profile.convert(Map<String, dynamic> json)
      : id = json['cst_id'],
        name = json['cst_name'],
        fcm_token = json['cst_fcm_token'],
        phone = json['cst_phone'],
        email = json['cst_email'],
        birthday = json['cst_birthday'],
        gender = json['cst_gender'],
        address = json['cst_address'];
  Profile.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        fcm_token = json['fcm_token'],
        phone = json['phone'],
        email = json['email'],
        birthday = json['birthday'],
        gender = json['gender'],
        address = json['address'];
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'fcm_token': fcm_token,
        'phone': phone,
        'email': email,
        'birthday': birthday,
        'gender': gender,
        'address': address
      };
}

class Credential {
  final String auth_token;
  final DateTime auth_expires;
  final String refresh_token;
  final DateTime refresh_expires;

  Credential(this.auth_token, this.auth_expires, this.refresh_token,
      this.refresh_expires);

  Credential.convert(
      Map<String, dynamic> authToken, Map<String, dynamic> refreshToken)
      : auth_token = authToken['token'],
        auth_expires = DateTime.parse(authToken['expires_at']),
        refresh_token = refreshToken['refresh'],
        refresh_expires = DateTime.parse(refreshToken['expires_at']);

  Credential.fromJson(Map<String, dynamic> json)
      : auth_token = json['auth_token'],
        auth_expires = DateTime.parse(json['auth_expires']),
        refresh_token = json['refresh_token'],
        refresh_expires = DateTime.parse(json['refresh_expires']);

  Map<String, dynamic> toJson() => {
        'auth_token': auth_token,
        'auth_expires': auth_expires.toString(),
        'refresh_token': refresh_token,
        'refresh_expires': refresh_expires.toString()
      };
}
