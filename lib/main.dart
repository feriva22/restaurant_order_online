import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_order_online/ui/screen/loginscreen.dart';
import 'package:restaurant_order_online/ui/screen/dashboardscreen.dart';
import 'package:restaurant_order_online/ui/screen/foodscreen.dart';
import 'package:restaurant_order_online/ui/screen/favoritescreen.dart';
import 'package:restaurant_order_online/ui/screen/profilescreen.dart';
import 'package:restaurant_order_online/ui/screen/detailproductscreen.dart';
import 'package:restaurant_order_online/ui/screen/cartscreen.dart';
import 'package:restaurant_order_online/ui/screen/notificationscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Poppins',
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => loginScreen(),
      '/dashboard': (context) => dashboardScreen(),
      '/foods': (context) => foodScreen(),
      '/favorite': (context) => favoriteScreen(),
      '/profile': (context) => profileScreen(),
      '/detailproduct': (context) => detailProductScreen(),
      '/cart': (context) => cartScreen(),
      '/notification': (context) => notificationScreen()
    },
  ));
}
