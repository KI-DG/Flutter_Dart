import 'package:flutter/material.dart';

class DefaultLayOut extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;
  const DefaultLayOut({
    required this.title,
    required this.body,
    this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: body,
      ),

    );
  }
}
