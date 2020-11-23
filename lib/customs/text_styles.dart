import 'package:flutter/material.dart';

Widget headerText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'Playfair',
      fontSize: 38.0,
      color: Colors.black,
    ),
  );
}

Widget bodyText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'Lato',
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
    ),
  );
}
