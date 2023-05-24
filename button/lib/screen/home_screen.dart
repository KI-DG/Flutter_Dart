import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('버튼'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  // Materialstate

                  // hovered - 호버링 상태(마우스 커서 올려놓은 상태) 모바일 불가
                  // focused - 포커스 됐을때(텍스트 필드)
                  // pressed - 눌렀을때 (o)
                  // dragged - 드래그 됐을 떄
                  // selected - 선택됐을때 (체크박스,라디어 버튼)
                  // scrollUnder - 다른 컴포넌트 밑으로 스크롤링 됐을때
                  // disabled - 비활성화 됐을때 (o)
                  // errored - 에러상태
                  // 모든 상태에서 똑같은 값을 적용
                  backgroundColor: MaterialStateProperty.all(
                     Colors.black
                  ),
                  // backgroundColor: MaterialStateProperty.resolveWith(
                  //   (Set<MaterialState> states) {
                  //     if (states.contains(MaterialState.pressed)) {
                  //       return Colors.pink;
                  //     }
                  //     return Colors.black;
                  //   },
                  // ),
                  // 특정상태에 의해서 변화게 하려면  resolveWith 사용
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.white;
                    }
                    return Colors.red;
                  }),
                  padding: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)){
                        return EdgeInsets.all(100.0);
                      }
                      return EdgeInsets.all(20.0);
                    },
                  ),
                ),
                child: Text(
                  'buttonStyle',
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  // 메인칼라
                  primary: Colors.red,
                  // 애니메이션 및 글자색
                  onPrimary: Colors.black,
                  // 그림자 색깔
                  shadowColor: Colors.green,
                  // 입체감을 줄 수 있는
                  elevation: 10.0,

                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                  padding: EdgeInsets.all(32.0),
                  side: BorderSide(
                    color: Colors.black,
                    width: 4.0,
                  ),
                ),
                child: Text('ElevatedButton'),
              ),
              // 테두리만
              OutlinedButton(
                onPressed: () {},
                child: Text('OutLineButton'),
                style: OutlinedButton.styleFrom(
                  // onPrimary 만 없음
                  // 글자색과 애니메이션 색깔이 변함
                  primary: Colors.pink,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('TextButton'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
