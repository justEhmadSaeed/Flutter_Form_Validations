import 'package:flutter/material.dart';

const kHeadingTextStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
const kTextFieldStyle = TextStyle(fontSize: 20);
const klabelStyle = TextStyle(fontSize: 20);
const kErrorStyle = TextStyle(fontSize: 15);
const kErrorMessageStyle = TextStyle(color: Colors.red);
final kButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.teal),
    ),
  ),
);
