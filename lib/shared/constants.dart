import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink, width: 2.0),
  ),
);

// Custom ID generator
String generateRequestID(int num, int currentMonth) {
  String monthComponent;
  String nR;

  if (currentMonth < 10) {
    monthComponent = '0' + currentMonth.toString();
  } else {
    monthComponent = currentMonth.toString();
  }

  if (num < 10) {
    nR = '0' + num.toString();
  } else {
    nR = num.toString();
  }

  return monthComponent + nR;
}