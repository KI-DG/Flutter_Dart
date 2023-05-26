# Flutter

### 기본 룰

main.dart

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
              'Hello World',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
          ),
        ),
      )
    )
  );
}

```

### Widget Tree

- Widget들의 부모, 자식 관계를 나태내는 것



### Splash Screen (처음 로딩 페이지)

- StatelessWidget 생성하기
  - 우리가 커스텀한 위젯

- Column 위젯
  - 기본위젯

- CircularProgressIndicator 위젯
  - 기본위젯

- Image 위젯
  - 기본위젯

#### Asset 추가하기 (이미지 파일을 추가하려면)

```dart
//pubspec.yaml 파일에서
    flutter: //여기 밑에다 작성
		- asset/img/ //이러면 여기 파일에 있는 모든 이미지 사용가능
            
// 추가하고
// Pub get을 꼭 눌러줘야 됨
```

- Colunm 세로 row 가로

- Color.(0x(16진수)FF(투명도)나머지 색)
- Colors.white

#### SafeArea 

- 아래와 위의 화면을 안넘어가게 하기위해서 사용
- bottom 에 주고 더주고 싶으면 bottom -false로 하면됨

```
// MainAxisAlignment - 주축정렬
// start - 시작
// end - 끝
// center - 가운데
// spaceBetween - 위젯과 위젯의 사이가 동일하게 배치된다
// spaceEvenly - 위젯을 같은 간격으로 배치하지만 끝과 끝에도
//               위젯이 아닌 빈 간격으로 시작한다.
// spaceAround - sapceEvenly + 끝과 끝의 간격은 1/2

// CrossAxisAlignment - 반대축 정렬
// start - 시작
// end - 끝
// center - 가운데
// stretch 끝까지 늘린다
crossAxisAlignment: CrossAxisAlignment.start,

// MainAxisSize - 주축 크기
// max - 최대
// min - 최소

// Expanded / Flexible - row 와 column안에서만 사용해야됨
// Expanded - 남아있는 공간을 최대한 차지해라
// Flexible - 남는 공간은 버려버린다.

```

````dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50.0,
                    width: 50.0,
                    color: Colors.red,
                  ),Container(
                    height: 50.0,
                    width: 50.0,
                    color: Colors.orange,
                  ),Container(
                    height: 50.0,
                    width: 50.0,
                    color: Colors.yellow,
                  ),Container(
                    height: 50.0,
                    width: 50.0,
                    color: Colors.green,
                  ),
                ],
              ),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.orange,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 50.0,
                    width: 50.0,
                    color: Colors.red,
                  ),Container(
                    height: 50.0,
                    width: 50.0,
                    color: Colors.orange,
                  ),Container(
                    height: 50.0,
                    width: 50.0,
                    color: Colors.yellow,
                  ),Container(
                    height: 50.0,
                    width: 50.0,
                    color: Colors.green,
                  ),
                ],
              ),Container(
                height: 50.0,
                width: 50.0,
                color: Colors.green,
              ),
            ],

          ),
        ),
      ),
    );
  }
}
````

- 결과물

<img src="C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230418133255927.png" alt="image-20230418133255927" style="zoom: 33%;" />

### 블로그 웹앱

- 외부 패키지 활용 
  - pub.dev
  - https://pub.dev/

````dart
pubspec.yaml
dependencies:
  flutter:
    sdk: flutter


  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.2
  webview_flutter: ^3.0.0
      		//		메이저버전.마이너버전.패치버전
//      pub get 버튼 누르기

android > app > build.gradle 
defaultConfig {
    minSdkVersion 20  
}
````

```dart
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('이기용'),
        centerTitle: true,
      ),
      body: WebView(
        // 처음 화면은 어디로 갈지 정하는거
        initialUrl: 'https://blog.codefactory.ai',
        // 유튜브 동영상 재생하기 위해서 사용
        javascriptMode: JavascriptMode.unrestricted,

      ),
    );
  }
}

```

### HTTP 사용하려면

```dart
ios > Runner > info.plist
    <key>NSAppTransportSecurity</key>
	<dict>
	    <key>NSAllowsLocalNetworking</key>
	    <true/>
	    <key>NSAllowsArbitraryLoadsInWebContent</key>
	    <true/>
	</dict>
    
android > app > src > main > AndroidManifest.xml
    <!-- 인터넷 권한 -->
    <uses-permission android:name="android.permission.INTERNET"/>
    <application
    android:usesCleartextTraffic="true">
```

- 4.0.2 버전 이상사용하려면 (web_view사용하려면)

```dart
main.dart
//Flutter 프레임워크가 앱을 실행할 준비가 될 때까지 기다린다.
  WidgetsFlutterBinding.ensureInitialized();

home_srceen.dart
import ~~~~
final homeUrl = Uri.parse('https://blog.codefactory.ai');

class HomeScreen extends StatelessWidget {

  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(homeUrl);
    
    
	IconButton(
            onPressed: () {
              controller.loadRequest(homeUrl);
            },
        
body: WebViewWidget(
        controller: controller,
      )
        }
```

### Widget 이론

- widget은 모두 "불변" 의 법칙을 갖고 있다
- 하지만 위젯의 값을 변경해야할때가 있다
- 변경이 필요하면 기존 위젯을 삭제해버리고 완전 새로운 위젯으로 대체한다

#### StatelessWidget 라이프 사이클(Life Cycle)

- Constructor로 생성이 되고 생성이 되자마자 build 함수가 실행된다
- 이전 Container 예제와 마찬가지로 변경이 필요하면 새로운 위젯을 만들어 버린다
- 하나의 StatelessWidget은 라이프 사이클동안 단 한번만 build 함수를 실행한다

#### StatefulWidget 라이프 사이클(Life Cycle)

![image-20230418155958636](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230418155958636.png)

![image-20230418160011148](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230418160011148.png)

![image-20230418160025635](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230418160025635.png)

StatefulWidget

````dart
class HomeScreen extends StatelessWidget {
  final Color color;

  const HomeScreen({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      color: color,
    );
  }
}
// == 같다
class HomeSrceen extends StatefulWidget {
  final Color color;

  const HomeSrceen({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeSrceen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      color: widget.color,
    );
  }
}

````



- GestureDetector
  - 위젯에서 활동하는 모든 액션을 감지할 수 있다
  - on을 누르면 많은 행동을 할 수 있다

### PageView

````dart
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
	Timer? timer;
    PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 4), (timer) {
      int currentPage = controller.page!.toInt();
      int nextPage = currentPage + 1;

      if (nextPage > 4) {
        nextPage = 0;
      }

      controller.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.linear,
      );
    });
  }

  // dispose를 해줘야 메모리 소모를 줄일수 있다
  @override
  void dispose() {
    controller.dispose();
    if (timer != null) {
      timer!.cancel();
    }

    super.dispose();
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [1, 2, 3, 4, 5]
            .map(
              (e) => Image.asset(
                'asset/img/image_$e.jpeg',
                fit: BoxFit.cover,
              ),
            )
            .toList(),
		// == 밑에 내용을 위에처럼 간단하게 할 수 있다
        // [
        //   Image.asset(
        //     'asset/img/image_1.jpeg',
        //     fit: BoxFit.cover,
        //   ),
        //   Image.asset('asset/img/image_2.jpeg',fit: BoxFit.cover,),
        //   Image.asset('asset/img/image_3.jpeg',fit: BoxFit.cover,),
        //   Image.asset('asset/img/image_4.jpeg',fit: BoxFit.cover,),
        //   Image.asset('asset/img/image_5.jpeg',fit: BoxFit.cover,),
        // ],
      ),
    );
  }
}

````

### DateTime 및 Duration

![image-20230419102242640](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230419102242640.png)

- 연도 월 일 시간 분 초 단위로 나옴

![image-20230419102551090](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230419102551090.png)

### 우리 처음 만날 U&I

#### Font 적용하기

- 구글 폰트 사용

```dart
pubspc.yaml
flutter:

  uses-material-design: true
  assets:
    - asset/img/

  fonts:
    - family: parisienne
      fonts:
        - asset: asset/font/Parisienne-Regular.ttf

    - family: sunflower
      fonts:
        - asset: asset/font/Sunflower-Light.ttf
        - asset: asset/font/Sunflower-Medium.ttf
          weight: 500
        - asset: asset/font/Sunflower-Bold.ttf
          weight: 700
```

```dart
import 'package:flutter/material.dart';

// 날짜를 관리하기 위해 Stateful위젯으로 변환
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // [100~900] 사이로 농도를 다르게 할 수 있음
        backgroundColor: Colors.pink[100],
        // remind (노치에서 벗어나게하기)
        body: SafeArea(
          child: Container(
              // 가운데 정렬
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Text(
                  'U&I',
                  style: TextStyle(
                    color: Colors.white,
                      //폰트 적용하기
                    fontFamily: 'parisienne',
                    fontSize: 80.0,
                  ),
                ),
                Text('우리 처음 만날날'),
                Text('2023.12.27'),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                  ),
                ),
                Text('D+1')
              ],
            ),
          ),
        ));
  }
}

```



#### DatePicker

- 날짜 선택하기 

````dart
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
````

#### 테마 적용하기(일괄적)

```dart
import 'package:flutter/material.dart';
import 'package:u_and_i/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'sunflower',
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontFamily: 'parisienne',
            fontSize: 80.0,
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 50.0,
          ),
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      home: HomeScreen(),
    ),
  );
}

home_screen
    @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    
 return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'U&I',
            style: textTheme.headline1,
          ),

```

### const

```dart
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

```

### Random_number

```dart
SizedBox(
              // 버튼을 끝까지 할때 sizedbox는 높이랑 넓이만 조절할 수 있음
    )
```



### Button

#### ElevatedButton

````dart
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
````



#### OutlinedButton

````dart
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
````



#### TextButton

````dart
TextButton(
                onPressed: () {},
                child: Text('TextButton'),
              )
````

#### Materialstate

````dart
ButtonStyle(				
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
)
````

### Navigator

#### layout

#### arguments

```dart
// 이동할때 arguments 이동하는 방법 1
Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => RouteTwoScreen(),
                settings: RouteSettings(
                  arguments: 789,
                ),
// 이동하는 곳에서 bulid 밑에서 선언
final arguments = ModalRoute.of(context)!.settings.arguments;

                              
// 이동할때 arguments 이동하는 방법 (뒤로가기 할때)
 Navigator.of(context).pop(456);
// 뒤로가는 페이지에서
async {
          final result = await Navigator.of(context).push

// 이동할때 arguments 이동하는 방법 2 (꼭 받을 수 있게 넣어준다)
MaterialPageRoute(
	builder: (BuildContext context) => RouteOneScreen(
	number: 123,
),
              
// 이동할때 arguments 이동하는 방법 3 (pushNamed 이용) pushNamed는 main에서 선언해줌
Navigator.of(context).pushNamed('/three', arguments: 999);
```

#### push

```dart
// pushReplacement 지금페이지에 대체를 해서 3번째 페이지를 띄우줌
Navigator.of(context).pushReplacementNamed(
              '/three',
            );
```

````dart
// route가 false 면 모든 페이지 삭제 true 이면 모든페이지 그대로 있음 
// route route.settings.name == '/' 이런식으로 하면 그 전까지의 페이지는 삭제 이것은 홈으로 가는 것임
Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (_) => RouteThreeScreen(),
                ),
                (route) => false);
          },

````

#### pop

````dart
// 뒤에 아무것도 없을때 그냥 아무곳에도 안간다
Navigator.of(context).maybePop()
    
// 안드로이드 시스템에서 뒤로 가게 하지 못하게 하려면
    WillPopScope(
      onWillPop: () async {
        // true - pop 가능
        // true - false 불가능
        return false;
      },
````

### decoration

```dart
// decoration 과 color 를 같이 사용하면 안된다
decoration: BoxDecoration(
    // 처음부터 일정하게 그라데이션 
	gradient : LinearGradient (
    begin : Alignment.~~
    end: Alignment.~~,
    colors:[ ]
    )
    
)
```



aspectRatio : 화면 비율 원본에 맞추는 것

Icon(Icons.play arrow)

### InkWell Vs GestureDetector

- 차이는 InkWell 애니메이션 효과가 있고 GestureDetector는 효과가 없다

