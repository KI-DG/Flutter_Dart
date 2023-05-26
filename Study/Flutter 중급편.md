# Flutter <중급편>

- 기능별로 폴더를 정리하는게 편하다 

## 로그인

### Token vs Session

#### Session이란

유저의 정보를 데이터베이스에 저장하고 상태를 유지하는 도구

##### 특징

![image-20230511153824054](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230511153824054.png)

- horizontal Scaling 수평적으로 여러개의 서버를 복제하는것임 (좀 더 찾아보자)

##### 생성방식

![image-20230511154728158](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230511154728158.png)

##### 사용방식

![image-20230511154812343](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230511154812343.png)



[차트] 왼쪽 끝에서 오른쪽 아래로 읽으면 됨

![image-20230511155127887](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230511155127887.png)

#### Token이란?

유저의 정보를 Base 64(64개 지정된 문자)로 인코딩된 String 값에 저장하는 도구

![image-20230511154446176](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230511154446176.png)

##### 생성방식

![image-20230511154926622](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230511154926622.png)

##### 사용방식

![image-20230511154954957](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230511154954957.png)

[차트] 왼쪽 끝에서 오른쪽 아래로 읽으면 됨

![image-20230511155233753](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230511155233753.png)

#### VS

![image-20230511155304486](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230511155304486.png)

### JWT

![image-20230511155411255](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230511155411255.png)

#### 예제

![image-20230511160028822](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230511160028822.png)

#### JWT to JSON

![image-20230511160101991](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230511160101991.png)



#### Refresh Token & Access Token

![image-20230511160356211](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230511160356211.png)

#### 토큰 발급 과정

![image-20230511160524098](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230511160524098.png)

![image-20230511160635292](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230511160635292.png)

2 . ID/Pass 검증이 아니고 Refresh Token 검증임

![image-20230511160804106](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230511160804106.png)

![image-20230511160853634](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230511160853634.png)



# test@codefatory.ai:testtest



### pagination

- 많은 데이터를 부분적으로 나눠서 불러오는 기술이다.

#### 특징

![image-20230512112315128](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230512112315128.png)

![image-20230512112707922](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230512112707922.png)



![image-20230512122701522](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230512122701522.png)

### dart 언어중 Factory

```dart
void main() {
    final parent = Parent(id: 1);
    
    final child =Child(id: 3);
}

class Parent{
    final int id;
    
    Parent({
        required this.id
    })
        
        facotry Parent.fromInt(int id){
        return Parent(id:id)
    }
}
class Child extend Parent{
    Child({
        required super.id
    })
}
```

- 모델화랑 json 화를 잘 하면 코드가 깔끔하게 보여줄 수 있다.



```dart
terminal 가서
    flutter pub run build_runner build 실행해준다. => 이럼 자동으로 Json 생성됨
	flutter pub run build_runner watch 로 틀어놓고 계속 바뀌게 할수 있음 터미널 두개 키고 사용

```

settings => LiveTemplates =>  + 

```dart
factory $NAME$.fromJson(Map<String, dynamic> json)
=> _$$$NAME$FromJson(json);
// 자동 완성을 만들수 있다 $$$ 가운데꺼는 인식 안한다.
```

### json_annotation: ^4.4.0

- json을 자동으로 만들어준다.

### retrofit_generator: '>=5.0.0 <6.0.0'

- api 부터 json까지 하는 부분을 자동화하려고 하기 때문에 사용

### dio 

- api 호출할때 편하게 불러오는 패키지

## 상태관리

### riverpod

````dart
								// 하나의 함수가 들어감, 관리하고 싶어하는 값을 반환해주면 된다.
final numberProvider = StateProvider<int>((ref) => 0);

````

### Provider

- 모든 provider는 글로벌하게 선언된다.
- 각각 다른 타입을 반환해주고 사용목적이 다르다.
- 사용하는 법은 다 똑같다.

#### Provider

- 가장 기본이 베이스가 되는 Provider
- 아무 타입이나 반환 가능
- Service, 계산한 값 등을 반환할때 사용
- 반환값을 캐싱할떄 유용하게 사용된다.
  - 빌드 횟수 최소화 가능
- 여러 Provider의 값들을 묶어서 한번에 반환값을 만들어 낼 수 있다.

#### StateProvider

- UI에서 "직접적으로" 데이터 변경할 수 있도록 하고 싶을 때 사용
- 단순한 형태의 데이터만 관리 (int, double, String)
- Map, List 등 복잡한 형태의 데이터는 다루지 않음
- 복잡한 로직이 필요한경우 사용하지 않음
  - number++ 정도의 간단한 로직으로만 한정

#### StateNotifierProvider

- UI에서 "직접적으로" 데이터 변경할 수 있도록 하고 싶을 때 사용
- 복잡한 형태의 데이터 관리가능 (클래스의 메소드를 이용한 상태관리)
- StateNotifier를 상속한 클래스를 반환

#### FutureProvider

- Future 타입만 반환가능
- API 요청의 결과를 반환할때 자유 사용
- 복잡한 로직 또는 사용자의 특정 행동뒤에 Future를 재실행하는 기능이 없음
  - 필요한 경우 StateNotifierProvider 사용
- 사실상 유용하지 않은 Provider

#### StreamProvider

- Stream 타입만 반환가능
- API 요청의 결과를 Stream으로 반환할때 자주 사용
  - Socket등

#### ChangeNotifierProvider (사용안함 - Provider 마이그네이션 용도)

![image-20230524101041849](C:\Users\SSAFY\AppData\Roaming\Typora\typora-user-images\image-20230524101041849.png)

#### ref.read vs ref.watch

- ref.watch는 반환값의 업데이트가 있을때 지속적으로 buil 함수를 다시 실행해준다.
- ref.watch는 필수적으로 UI관련 코드에만 사용
- ref.read는 실행되는 순간 단 한번만 Provider값을 가져온다.
- ref.read는 onPressed 콜백처럼 특정 액션 뒤에 실행되는 함수 내부에서 사용된다.