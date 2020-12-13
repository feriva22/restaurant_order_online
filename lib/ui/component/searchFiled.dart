import 'package:flutter/material.dart';

Widget inputField = Container(
  alignment: Alignment.centerLeft,
  color: Colors.white,
  child: TextField(
    obscureText: true,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(5, 2, 5, 2),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
        hintText: 'Search'),
  ),
);
