import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // remind 빌드타입때 모든 값을 알수 있을 때 const 사용
            const TestWidget(label: 'test1'),
            const TestWidget(label: 'test2'),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: const Text('빌드!'),
            )
          ],
        ),
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  final String label;

  const TestWidget({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('$label bulid 실행!');

    return Container(
      child: Text(
        label,
      ),
    );
  }
}
