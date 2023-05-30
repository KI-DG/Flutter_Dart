import 'package:actual_riverpod/riverpod/provider_observers.dart';
import 'package:actual_riverpod/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
    observers: [
      Logger(),
    ],
    child: MaterialApp(
      home: HomeScreen(),
    ),
  ));
}
