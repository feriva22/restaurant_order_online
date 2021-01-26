import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:restaurant_order_online/ui/screen/all.dart';
import 'package:restaurant_order_online/models/all.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      Provider(create: (context) => CategoryModel()),
      Provider(create: (context) => MenuModel()),
      ChangeNotifierProxyProvider<MenuModel, CartModel>(
        create: (context) {
          CartModel();
        },
        update: (context, menu, cart) {
          cart.menu = menu;
          return cart;
        },
      ),
    ],
    builder: (context, child) {
      Widget initScreen;
      switch (context.watch<AuthProvider>().appState) {
        case AppState.authenticating:
        case AppState.unauthenticated:
          initScreen = loginScreen();
          break;
        case AppState.initial:
          initScreen = loginScreen();
          break;
        case AppState.authenticated:
          initScreen = dashboardScreen();
          break;
      }
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        home: initScreen,
        routes: {
          '/dashboard': (context) => dashboardScreen(),
          '/foods': (context) => foodScreen(),
          '/favorite': (context) => favoriteScreen(),
          '/profile': (context) => profileScreen(),
          '/detailproduct': (context) => detailProductScreen(),
          '/cart': (context) => cartScreen(),
          '/notification': (context) => notificationScreen(),
          '/reservation': (context) => reservationScreen()
        },
      );
    },
  ));
}
