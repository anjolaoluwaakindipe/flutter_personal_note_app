import 'package:flutter/material.dart';
import 'package:note_app/constants/constants.dart';

AppBar noteAppBar = AppBar(
  title: const Text(
    "Notes",
    style: TextStyle(fontWeight: FontWeight.w600),
  ),
  elevation: 0,
  backgroundColor: blue,
  actions: const <Widget>[
    Icon(
      Icons.search,
    ),
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
      ),
    ),
    Icon(
      Icons.settings_outlined,
    ),
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
      ),
    )
  ],
);
