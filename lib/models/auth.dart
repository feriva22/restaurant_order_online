import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppState { initial, authenticated, authenticating, unauthenticated }

class AuthProvider extends ChangeNotifier {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);
  FirebaseMessaging fm = FirebaseMessaging();
  GoogleSignInAccount _currentUser;
  AppState _appState = AppState.initial;

  AppState get appState => _appState;
  GoogleSignInAccount get currentUser => _currentUser;

  //constructor
  AuthProvider() {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      if (account == null) {
        _appState = AppState.unauthenticated;
      } else {
        _currentUser = account;
        _appState = AppState.authenticated;
        print(account.toString());
        fm.getToken().then((value) => print('FCM Token : ' + value));
        fm.configure();
      }
      print(_appState);
      notifyListeners();
    });
    _googleSignIn.signInSilently();
  }

  Future<bool> login() async {
    try {
      _appState =
          AppState.authenticating; //set current state to loading authenticating
      notifyListeners();

      GoogleSignInAccount account = await _googleSignIn.signIn();

      if (account == null) {
        _appState = AppState.unauthenticated;
        notifyListeners();
        return false;
      }
      return true;
    } catch (err) {
      _appState = AppState.unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future logout() async {
    await _googleSignIn.signOut();
    _appState = AppState.unauthenticated;
    _currentUser = null;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }
}
