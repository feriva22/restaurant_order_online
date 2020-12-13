import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_order_online/ui/screen/loginscreen.dart';
import 'package:restaurant_order_online/ui/screen/dashboardscreen.dart';
import 'package:restaurant_order_online/ui/screen/foodscreen.dart';
import 'package:restaurant_order_online/ui/screen/favoritescreen.dart';
import 'package:restaurant_order_online/ui/screen/profilescreen.dart';

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
      '/profile': (context) => profileScreen()
    },
  ));
}

/*class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          hintColor: Color(0xFFC0F0E8),
          primaryColor: Color(0xFF80E1D1),
          canvasColor: Colors.transparent,
          fontFamily: "Montserrat"),
      home: HomeScreen(),
    );
  }
}*/
