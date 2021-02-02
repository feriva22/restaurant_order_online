import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:restaurant_order_online/ui/screen/all.dart';
import 'package:restaurant_order_online/models/all.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

void main() async {
  // NOTE: The filename will default to .env and doesn't need to be defined in this case
  await DotEnv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      Provider(create: (context) => MenuModel()),
      ChangeNotifierProxyProvider<AuthProvider, CategoryModel>(
        create: (context) => CategoryModel(),
        update: (context, auth, category) => CategoryModel(authProvider: auth),
      ),
      ChangeNotifierProxyProvider<MenuModel, CartModel>(
        create: (context) => CartModel(),
        update: (context, menu, cart) {
          cart.menu = menu;
          return cart;
        },
      ),
    ],
    builder: (context, child) {
      Widget initScreen = loginScreen();

      switch (context.watch<AuthProvider>().appState) {
        case AppState.unauthenticated:
          initScreen = loginScreen();
          break;
        case AppState.loading:
          print('LOADING SKUY');
          initScreen = loadingScreen();
          break;
        case AppState.initial:
          initScreen = loginScreen();
          break;
        case AppState.authenticated:
          initScreen = dashboardScreen();
          break;
        case AppState.authenticating:
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

class loadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => loadingScreenState();
}

class loadingScreenState extends State<loadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
