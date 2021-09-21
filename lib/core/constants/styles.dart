import 'package:flutter/material.dart';
import 'package:chat_app/core/constants/colors.dart';

const kAppbarTitleStyle = TextStyle(
  fontFamily: "Source Sans Pro",
  fontWeight: FontWeight.bold,
  color: kHeadingColor,
  letterSpacing: 1,
  fontSize: 25.0,
);

const kTitleStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: kAccountTitleColor,
    letterSpacing: 1.2);

const kSubtitleStyle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: kLastMessageColor,
    letterSpacing: 1.2);

const kTextFieldStyle = InputDecoration(
    hintStyle: TextStyle(color: kHeadingButtonColor),
    // kHeadingButtonColor is the same as we want for hint text
    hintText: 'Enter Email',
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(28.0)),
      borderSide: BorderSide.none,
    ));

const kTextFieldTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 20,
);
