import 'package:flutter/material.dart';
import 'package:navigation/screen/home_screen.dart';
import 'package:navigation/screen/router_one.dart';
import 'package:navigation/screen/router_three.dart';
import 'package:navigation/screen/router_two.dart';

void main() {
  runApp(
    MaterialApp(
      // home: HomeScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/one': (context) => RouteOneScreen(),
        '/two': (context) => RouteTwoScreen(),
        '/three': (context) => RouteThreeScreen(),
      },
    ),
  );
}
