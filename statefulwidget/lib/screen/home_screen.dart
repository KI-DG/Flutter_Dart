import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Color color;

  HomeScreen({
    required this.color,
    Key? key,
  }) : super(key: key){
    print('Widget Constructor 실행');
  }

  @override
  _HomeScreenState createState() {
    print('createState 실행');
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int number = 0;
  @override
  void initState() {
    print('initState 실행!');
    // TODO: implement initState
    super.initState();

  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies 실행!');
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

  }

  @override
  void deactivate() {
    print('deactivate 실행!');
    // TODO: implement deactivate
    super.deactivate();

  }

  @override
  void dispose() {
    print('dispose 실행!');
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    // TODO: implement didUpdateWidget
    print('didUpdateWidget 실행!');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('bulid 실행!');
    return GestureDetector(
      onTap: (){
        setState(() {
          number ++;
        });
      },
      child: Container(
        width: 50.0,
        height: 50.0,
        color: widget.color,
        child: Center(
          child: Text(number.toString(),
          ),
        ),
      ),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   final Color color;
//
//   const HomeScreen({
//     required this.color,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 50.0,
//       height: 50.0,
//       color: color,
//     );
//   }
// }
