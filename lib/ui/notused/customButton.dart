import 'package:flutter/material.dart';

Widget filledButton(String text, Color splashColor, Color highlightColor,
    Color fillColor, Color textColor, void function()) {
  return RaisedButton(
    highlightElevation: 0.0,
    splashColor: splashColor,
    highlightColor: highlightColor,
    elevation: 0.0,
    color: fillColor,
    shape:
        RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
    child: Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
    ),
    onPressed: () {
      function();
    },
  );
}

Widget loginRegis(context, _onpressed) {
  return OutlineButton(
    highlightedBorderColor: Colors.white,
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    highlightElevation: 0.0,
    splashColor: Colors.white,
    highlightColor: Theme.of(context).primaryColor,
    color: Theme.of(context).primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    ),
    child: Text(
      "REGISTER",
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
    ),
    onPressed: () {
      _onpressed;
    },
  );
}
