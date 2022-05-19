/*
OpenLeaves Project.
Super cool Hymn book project demo.
*/

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_leaves/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Open Leaves",
      home: const HomeScreen(),
      theme: ThemeData(
          visualDensity: Platform.isLinux
              ? VisualDensity.comfortable
              : VisualDensity.adaptivePlatformDensity,
          textTheme:
              const TextTheme(bodyText1: TextStyle(fontFamily: 'Nunito'))),
      debugShowCheckedModeBanner: false,
    );
  }
}
