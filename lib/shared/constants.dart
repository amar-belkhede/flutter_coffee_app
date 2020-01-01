import 'package:flutter/material.dart';

InputDecoration textInputDecoration(String name) {
  return InputDecoration(
    hintText: name,
    fillColor: Colors.brown[100],
    filled: true,
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red[200], width: 2.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red[400], width: 2.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.brown[200], width: 2.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.brown[400], width: 2.0),
    ),
  );
}
