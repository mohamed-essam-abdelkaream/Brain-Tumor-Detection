import 'package:flutter/material.dart';

Widget defaultButton({
  String text = 'LOGIN',
  required Function? Function() function,
}) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(50.0)),
      child: MaterialButton(
        child:
        Text(text, style: TextStyle(fontSize: 20.0, color: Colors.white)),
        onPressed: function,
      ),
    );
