import 'package:flutter/material.dart';

const kBottomSheetDecoration = BoxDecoration(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(15),
    topRight: Radius.circular(15),
  ),
  color: Colors.white,
);

const kTaskTextFieldDecoration = InputDecoration(
  isDense: true,
  contentPadding: EdgeInsets.symmetric(
    vertical: 30.0,
  ),
  enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
    color: Color(0xff5786FF),
  )),
  focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
    color: Color(0xff0000FF),
  )),
  hintText: "What's on the agenda?",
);
