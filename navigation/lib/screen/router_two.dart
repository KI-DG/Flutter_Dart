import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/router_three.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return WillPopScope(
      onWillPop: () async {
        // true - pop 가능
        // true - false 불가능
        return false;
      },
      child: MainLayout(
        title: 'Route Two',
        children: [
          Text(
            'arguments : ${arguments}',
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Pop'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/three', arguments: 999);
            },
            child: Text('push Named'),
          ),
          ElevatedButton(
            onPressed: () {
              // pushReplacement 지금페이지에 대체를 해서 3번째 페이지를 띄우줌
              Navigator.of(context).pushReplacementNamed(
                '/three',
              );
            },
            child: Text('replace'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (_) => RouteThreeScreen(),
                  ),
                  (route) => route.settings.name == '/');
            },
            child: Text('psuh and Remove Until'),
          ),
        ],
      ),
    );
  }
}
