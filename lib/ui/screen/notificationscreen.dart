import 'package:flutter/material.dart';
import 'package:restaurant_order_online/ui/component/card.dart';
import 'package:restaurant_order_online/ui/component/customAppBar.dart';

class notificationScreen extends StatelessWidget {
  Color blueFont = Color(0xFF153E73);
  Color themeColor = Color(0xFFFF0A0A).withOpacity(0.8);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: customAppBar(noSearch: true, title: "Notifikasi"),
      body: Stack(
        children: [],
      ),
    );
  }
}
