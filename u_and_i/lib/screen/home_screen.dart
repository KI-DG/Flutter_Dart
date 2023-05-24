// ios
import 'package:flutter/cupertino.dart';
// google
import 'package:flutter/material.dart';

// 날짜를 관리하기 위해 Stateful위젯으로 변환
class HomeScreen extends StatefulWidget {
  // 최상위 트리위에 상태관리를 해줘야
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectdDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
          bottom: false,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              _TopPart(
                selectedDate: selectdDate,
                onPressed: onHeartPressed,
              ),
              _BottonPart(),
            ]),
          )),
    );
  }

  void onHeartPressed() {
    final now = DateTime.now();

    // dialog
    showCupertinoDialog(
      context: context,
      // 흰색 창 밖에 누르면 닫히게 한다
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          // 정렬기준을 알려줘야 된다
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300.0,
            // 날짜 선택하기
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              // 기존이 되는 날짜선택하기 위해
              initialDateTime: selectdDate,
              // 최대로 할 수 있는 날 오늘
              maximumDate: DateTime(
                now.year,
                now.month,
                now.day,
              ),
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  selectdDate = date;
                });
                ;
              },
            ),
          ),
        );
      },
    );
  }
}

class _TopPart extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPressed;

  _TopPart({required this.selectedDate, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final now = DateTime.now();

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'U&I',
            style: textTheme.headline1,
          ),
          Column(
            children: [
              Text(
                '우리 처음 만날날',
                  style: textTheme.bodyText1,
              ),
              Text(
                '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
                style: textTheme.bodyText2,
              ),
            ],
          ),
          IconButton(
            iconSize: 60.0,
            onPressed: onPressed,
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          Text(
            'D+${DateTime(
                  now.year,
                  now.month,
                  now.day,
                ).difference(selectedDate).inDays + 1}',
            style: textTheme.headline2,
          )
        ],
      ),
    );
  }
}

class _BottonPart extends StatelessWidget {
  const _BottonPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        'asset/img/middle_image.png',
      ),
    );
  }
}
