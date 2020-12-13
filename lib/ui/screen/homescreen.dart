import 'package:flutter/material.dart';
import 'package:restaurant_order_online/ui/notused/logo.dart';
import 'package:restaurant_order_online/ui/notused/customButton.dart';
import 'package:restaurant_order_online/ui/notused/cliper.dart';

class HomeScreen extends StatelessWidget {
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
        home: Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Theme.of(context).primaryColor,
            appBar: AppBar(
              title: Text("Flutter Test"),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Align(
                    child: ClipPath(
                      child: Container(
                        color: Colors.white,
                        height: 300,
                      ),
                      clipper: BottomWaveClipper(),
                    ),
                    alignment: Alignment.bottomCenter,
                  ),
                )
              ],
            )));
  }
}
