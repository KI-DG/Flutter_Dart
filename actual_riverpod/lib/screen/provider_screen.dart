import 'package:actual_riverpod/layout/default_layout.dart';
import 'package:flutter/material.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayOut(
      title: 'ProviderScreen',
      body: ListView(
        children: [],
      ),
    );
  }
}
