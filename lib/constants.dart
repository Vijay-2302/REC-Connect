import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: '',
  fillColor: Color(0xFFF6F6F6),
  filled: true,
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular( 20.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.purple, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.purpleAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
);