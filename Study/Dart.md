# Dart

타입을 해주는 이유가 코드가 길어지면 알아보기 쉽게 하기 위해 타입을 지정해준다

## Type

### var 

- 재할당이 가능함
- 다른 타입으로 변경이 불가능

### int 

- 정수를 사용할 때 가능
- 사칙연산가능

### double 

- 실수를 사용할때 사용

### boolean

- true/ false
- bool을 앞에서 씀

### String 

- 대문자로 선언해야됨

- '${변수}' 이렇게 하면 변수로 사용가능

- .runtimeType 타입을 알수 있음

### dynamic 

- 타입을 변환 시킬 수 있다

### nullable/ non-nullable

- null 이 될 수 있다, null 이 될 수 없다
- 타입 뒤에 ? 를 넣어주면은 null과 타입이 둘다 들어갈 수 있다. ex) String?

- ! 를 붙이면 null이 절대 안되고 무조건 타입만 가능 ex) name!

### final

````dart
final String name = '코드팩토리';

final name = '코드팩토리';

print (name)
````

- final 로 선언하면 절대로 변수 변경이 불가능
- 타입을 제거할수 있다
- 빌드 타입을 몰라도 된다
- var를 생략해도된다

### const

````dart
const String name2 = '코드팩토리'
    
const name2 = '코드팩토리'
````

- 빌드타입을 알고 있어야 된다
- var를 생략해도된다

####  빌드타입이란?

- 이진수로 변환 프로그래밍언어로 만든다
- 이 코드가 언제 할지 모른다. 그래서 const는 안된다
- 컴파일하고 실행 가능한 형태로 변환하는데 걸리는 시간을 의미

### 현재시간

- DateTime(class명) now = DateTime.now() 현재시간을 알 수 있다



````dart
number ++; 1 +증가
number --; 1 -증가
    
number += 1; // 파이썬하고 비슷
number -= 2;
number *= 2;
number /= 2;

double number = 4.0;
number = 2.0;
number = null; // 이게 없으면 number는 2.0 있으면 3.0
number ??= 3.0;
// number 가 null값이면 3.0으로 바꿔라

int number1 = 1;
int number2 = 2;

부등호
	>
	<
	>=
	<=
	==
	!=
타입 비교
    number1 is int
    number1 is String
    
    number1 is! int
    number1 is! String
    
    && == and 조건
    || == or  조건
	
````

### list 

````dart
List<String> //String 제너릭안에 타입의 리스트가 모두 String이어야 됨

List<String> blackPink =["제니", "지수", "로제", "리사"];

// index 
// 순서
// 0 부터시작
// 길이를 알아볼수 있는 .length
// list에 값을 더 넣을 때 .add('값')
// list에 값을 지울 때 .remove('값')
// list에서 index값을 알고 싶을 때 indexOf('값')

// Map 
// key / value 
Map<String, String> dictionary ={
    'Harry Potter': "해리포터",
    'Ron Weasley' : "론 위즐리"
};

Map에 추가하고 싶을때 
    1)
    .addAll()
    dictionary['Harry Potter']
    2)
    
	dictionary['Hulk'] = '헐크';

//지우고 싶을때 .remove

dictionayr.keys; //(키값만 가져온다)
dictionayr.values; //(value값만 가져온다)

//Set 중복값을 처리해준다 
final Set<String> names ={
    'ㅇㅇㅇ',
    'ㅇㅇㅇ'
}

.add();
.remove();
.contains(); //있는지 없는지 확인할때
````



### if 문 

````dart
if (number % 3 == 0){
    print('값이 짝수 입니다.');
} else if (number % 3 == 1) {
    print('나머지가 1입니다.');
} else {
    print('값이 홀수 입니다.');
}

//switch 문
int number = 3;
switch(number % 3) {
    case 0:
        print('나머지가 0입니다.');
        break;
            
    case 1:
        print('나머지가 1입니다.');
        break;
            
        default:
        print('나머지가 2입니다.');
        break;
}
// loop  반복적인 작업을 할때 좋은것
// for (변수 선언; 언제까지 실행하는지; 어떤 변화를 줄지)
for (int i = 0; i < 10; i++){
    print(i);
}

List<int> numbers = [1, 2, 3, 4, 5, 6]

for(int nubmer in numbers) {
    total += number;
    print(number)
}
 
````

### while loop

```dart
int total = 0;

while (total  < 10){
    total += 1;
    
    if (total == 5){
        break;
    }
}

```

continue == 그 조건만 스킵한다

break == 조건문을 나온다

### enum

```dart
enum Status{
    approved,
    pending,
    rejected,
}

void main() {
    Status status = Status.approved;
    
    if (status == Status.approved){
        print('승인입니다.');
    }else if (status == Status.pending){
        print('대기입니다.');
    }else{
        print('거절입니다.');
    }
}
```

### 함수 선언

- 선언한 함수를 재활용하는것

```dart
void main () {
   	addNumbers();
}
//세개의 숫자 (x, y, z)를 더하고 짝수인지 홀수인지 알려주는 함수
//parameter / argument - 매개변수
// positional parameter - 순서가 중요한 파라미터

addNumbers(int x, int y, int z){
    //int x = 10;
    //int y = 20;
    //int z = 30;
    
    int sum = x + y +z;
    
    if (sum % 2 == 0) {
        print('짝수입니다.');
    } else {
        print('홀수입니다.')
    }
}
// optional parameter - 있어도 되고 없어도 되는 파라미터 
// 기본값을 넣을수 있음 
addNumbers(int x, [int y = 20, int z = 30]){
    
    int sum = x + y +z;
    
    if (sum % 2 == 0) {
        print('짝수입니다.');
    } else {
        print('홀수입니다.')
    }
}

void main () {
   	addNumbers(x : 10, y : 20, z : 30);
}
// named parameter - 이름이 있는 파라미터 (순서가 중요하지 않다.)
// required 꼭 필요하다 
// optional parameter 로 변경하는 방법 required를 지워주고 "int z = 기본값" 을 넣어주면 됨
addNumbers({
    required int x,
    required int y,
    required int z,
}){
    int sum = x + y +z;
    
    if (sum % 2 == 0) {
        print('짝수입니다.');
    } else {
        print('홀수입니다.')
    }
}
```

### void 

- 결과 값을 반환해야된다

````dart
void main () {
	int result = addNumbers(x : 10, y : 20, z : 30);
    int result2 = addNumbers (x: 20, y: 30);
        
   	print('result : $result');
    print('result2 : $result2');
    print('sum : ${result + result2}');
}

int addNumbers({
    required int x,
    required int y,
    int z = 30,
}){
    int sum = x + y +z;
    
    if (sum % 2 == 0) {
        print('짝수입니다.');
    } else {
        print('홀수입니다.');
    }
    
    return sum;
}
````

### arrow 함수 

- 화살표 함수

```dart
int addNumbers({
    required int x,
    required int y,
    int z = 30,
}) => x + y + z;
```

### typedef 

```dart
void main(){
    Operation operation = add;
    
    int result = operation(10, 20, 30);
    print(result);
        
    operation = subtract;
    
    int result2 = operation(10, 20, 30);
    print(result2)
        
    int result3 = calculate(30, 40, 50, add);
    print(result3)
   
    int result3 = calculate(30, 40, 50, subtract);
    print(result3)
      
}
typedef Operation = int Function(int x , int y, int z);

//더하기 
int add (int x, int y, int z ) => x + y + z;

//빼기 
int subtract(int x, int y, int z) => x - y - z;

// 계산기
int calculate(int x, int y, int z, Operation operation) {
    return operation (x, y, z)
}
```

## OOP 객체 지향 프로그래밍 (Objcet Oriented Programming)

### class (클래스)

- instance(인스턴스) - 무한하게 생성가능

- class 정의 설게도를 만드는것

```dart
void main() {
  Idol blackPink = Idol(
    '블랙핑크',
    ['제니', '로제', '지수', '리사']
  );
  
  print(blackPink.name);
  print(blackPink.members);
  
  blackPink.sayHello();
  blackPink.introduce();
  
  Idol bts = Idol(
    'BTS',
    ['RM', '진', '슈가']
  );
  print(bts.name);
  print(bts.members);
  bts.sayHello();
  bts.introduce();
}


// Idol class
// name (이름) - 변수
// members (맴버들) - 변수
// sayHello (인사) - 함수
// introduce (소개) - 함수
//
//constructor(생성자)
class Idol {
  String name;
  List<String> members;
  
  Idol(String name, List<String> members)
    : 
  this.name= name,
  this.members= members;
  
  void sayHello(){
    print('안녕하세요 ${this.name}입니다.');
  }
  
  void introduce(){
    print('${this.members}는 사랑입니다');
  }
}
 
```

- 더 간단하게

````dart
void main() {
  Idol blackPink = Idol(
    '블랙핑크',
    ['제니', '로제', '지수', '리사']
  );
  
  print(blackPink.name);
  print(blackPink.members);
  
  blackPink.sayHello();
  blackPink.introduce();
  
  Idol bts = Idol.fromList(
   [
     ['RM', '진', '슈가'],
     'BTS'
   ]
  );
  print(bts.name);
  print(bts.members);
  bts.sayHello();
  bts.introduce();
}


// Idol class
// name (이름) - 변수
// members (맴버들) - 변수
// sayHello (인사) - 함수
// introduce (소개) - 함수
//
//constructor(생성자)
class Idol {
  String name;
  List<String> members;
  
  Idol(this.name, this.members);
  
  Idol.fromList(List values)
    : this.members = values[0],
      this.name = values[1];
  
  void sayHello(){
    print('안녕하세요 ${this.name}입니다.');
  }
  
  void introduce(){
    print('${this.members}는 사랑입니다');
  }
}
//immutable 프로그래밍 = 변수들을 변화하지 못하게 하기위해서 사용
class Idol {
  final String name;
  final List<String> members;
    
  const Idol(this.name, this.members);
}
````

```dart
void main() {
  Idol blackPink =  Idol(
    '블랙핑크',
    ['제니', '로제', '지수', '리사']
  );
  
  print(blackPink.firstMember);
  
  Idol bts = Idol.fromList(
   [
     ['RM', '진', '슈가'],
     'BTS'
   ]
  );
  
  print(blackPink.firstMember);
}


// getter / setter
// 데이터를 가져올때 / 데이터를 설정할때
// 외부에서 사용 못하게 하려면 _ 붙여주면 된다
class Idol {
  String name;
  List<String> members;
  
  Idol(this.name, this.members);
  
  Idol.fromList(List values)
    : this.members = values[0],
      this.name = values[1];
  
  void sayHello(){
    print('안녕하세요 ${this.name}입니다.');
  }
  
  void introduce(){
    print('${this.members}는 사랑입니다');
  }
  
  //getter => 왜 사용하냐? 데이터를 가공할때 사용 
  String get firstMember{
    return this.members[0];
  }
//setter 무조건 한개만 가져와야된다 현대에 많이 사용하지 않는다.
  set firstMember(String name) {
    this.members[0] = name;
  }  
}

```

### inheritance(상속)

```dart
void main() {
  Idol apink = Idol(name: '에이핑크', membersCount: 5);
  
  apink.sayName();
  apink.sayMembersCount();
  
  
  BoyGroup bts = BoyGroup('BTS', 7);
  
  bts.sayName();
  bts.sayMembersCount();
  bts.syaMale();
  
  GirlGroup redVelvet = GirlGroup('Red Velvet', 5);
  
  redVelvet.sayName();
  redVelvet.sayMembersCount();
  redVelvet.sayFeMale();
}

// 상속 - inheritance 
//
// 상속을 받으면 부모 클래스의 모든 속성을 자식클래스가 부여받는다. 
class Idol{
  //이름
  String name;
  int membersCount;
    
  Idol({
    required this.name,
    required this.membersCount,
  });
  
  void sayName(){
    print('저는 ${this.name}입니다.');
  }
  void sayMembersCount(){
    print('${this.name}은 ${this.membersCount}명의 맴버가 있습니다.');
  }
}
// 상속
// 부모 받으려면 super 왼쪽 자식 오른쪽 부모
class BoyGroup extends Idol{
  BoyGroup(
    String name,
    int membersCount,
  ): super(
    name: name,
    membersCount: membersCount);
  
  void syaMale (){
    print('저희는 남자그룹입니다.');
  }
}
class GirlGroup extends Idol{
  GirlGroup(
    String name,
    int membersCount,
  ): super(
    name: name,
    membersCount: membersCount);
  
  void sayFeMale (){
    print('저희는 여자그룹입니다.');
  }
}
```

### method

```dart
void main() {
  TimesTwo tt = TimesTwo(2);
  
  print(tt.calculate());
  
  TimesFour tf = TimesFour(2);
  
  print(tf.calculate());
}

// method - function (class 내부에 있는 함수)
// override - 덮어쓰다 (우선시하다)

class TimesTwo{
  final int number;
  
  TimesTwo(
  this.number,
  );
  
  // method
  int calculate(){
    return this.number * 2;
  }
}

class TimesFour extends TimesTwo{
  TimesFour(
  int number,
  ):super(
    number
  );
  
  @override // 생략해도 되지만 직관적으로 보이기 위해 필요하다
  int calculate(){
    return super.calculate() * 2;
    // return this.calculate() * 2; 이건안된다
    // return super.number * 4;
    // return this.number * 4;
    // return number * 4;
  }
}
```

### static

```dart
void main() {
  Employee seulgi = Employee('슬기');
  Employee chorong = Employee('초롱');
  
  Employee.building = '오투타워';
  
  seulgi.printNameAndBuilding();
  chorong.printNameAndBuilding();
  
  Employee.printBuilding();
}

// 알바생관리
class Employee {
  // static은 instance에 귀속되지 않고 class에 귀속된다.
  // 알바생이 일하고 있는 건물
  static String? building;
  //알바생 이름
  final String name;
  
  Employee(
    this.name,
  );
  
  void printNameAndBuilding(){
    print('제 이름은 $name 입니다. $building 건물에서 근무하고 있습니다.');
  }
  
  static void printBuilding(){
    print('저는 $building 건물에서 근무중입니다.');
  }
}
```

### interface

````dart
void main() {
  BoyGroup bts = BoyGroup('BTS');
  GirlGroup redVelvet = GirlGroup('레드밸벳');
  
  bts.sayName();
  redVelvet.sayName();
}
// interface 특수한 구조를 강조한다 abstract추상적 이것을 interface앞에 많이 사용 
abstract class IdolInterface {
  String name;
  
  IdolInterface(this.name);
  
  void sayName();
}

class BoyGroup implements IdolInterface{
  String name;
  BoyGroup(this.name);
    
  void sayName(){
    print('제 이름은 $name입니다');
  }
}

class GirlGroup implements IdolInterface{
  String name;
  GirlGroup(this.name);
    
  void sayName(){
    print('제 이름은 $name입니다');
  }
}
````

### generic 

- 타입을 외부에서 받을때 사용

```dart
void main() {
  Lecture<String> lecture1 = Lecture ('123', 'lecture1');
  
  lecture1.printIdType();
  
  Lecture<int> lecture2 = Lecture(123, 'lecture2');
  
  lecture2.printIdType();
}


class Lecture<T> {
  final T id;
  final String name;
  
  Lecture(this.id, this.name);
  
  void printIdType(){
    print(id.runtimeType);
  }
}
```

## Functional Programming 함수형 프로그래밍

### List를 mapping 하는 법

```dart
List<String> blackPink = ['로제', '지수', '리사', '제니'];
  
  final newBlackPink = blackPink.map((x){
    return '블랙핑크 $x';
  });
  
  print(newBlackPink.toList());
  
  final newBlackPink2 = blackPink.map((x) => '블랙핑크 $x');
  
  print(newBlackPink2.toList());
  
  String nubmer = '13579';
  
  final parsed = nubmer.split('').map((x) => '$x.jpg').toList();
  
  print(parsed);
```





### asMap()

- {key: value} 값으로 하나씩 나타남

```dart
Map black = black.asMap();
```

```dart
void main() {
  Map<String, String> harryPotter = {
    'Harry Potter' : '해리 포터',
    'Ron weasley' :  '론 위즐리',
    'Hermione Granger' : '헤르미온느 그레인저'
  };
  
  final harryPotterCharacter = harryPotter.map(
    (key, value)=> MapEntry(
      'Harry Potter Character $key',
      '해리포터 캐릭터 $value',
      )
    );
  print(harryPotterCharacter);
  
  final keys = harryPotter.keys.map((x) =>'HPC $x').toList();
  
  final values = harryPotter.values.map((x) => '해리포터 $x').toList();
  
  print(keys);
  print(values);
}
```



### toSet()

- 중복된 값을 제거함

````dart
Set black = Set.from(black)
````

````dart
void main() {
  Set blackPinkSet = {
    '로제',
    '제니',
    '지수',
    '리사',
  };
  
  final newSet = blackPinkSet.map((x) => '블랙핑크 $x').toSet();
  
  print(newSet);
}
````

### List 안에 Map 사용

```dart
void main() {
  List<Map<String, String>> people = [
    {
      'name' : '로제',
      'group' : '블랙핑크'
    },
    {
      'name' :'지수',
      'group' : '블랙핑크'
    },
    {
      'name' : 'RM',
      'group' : 'BTS'
    },
    {
      'name' : '뷔',
      'group' : 'BTS'
    },
  ];
  
  print(people);
  final blackPink = people.where((x) => x['group'] == '블랙핑크').toList();
  final bts = people.where((x) => x['group'] == 'BTS').toList();
  
  print(blackPink);
  print(bts);
}
```

### reduce

- 리턴하는 값이 List에 타입과 똑같아야 된다.

```dart
void main() {
  List<int> numbers = [
    1,
    3,
    5,
    7,
    9
  ];  
  
  final result = numbers.reduce((prev, next){
    print('--------');
    print('previous : $prev');
    print('next : $next');
    print('total : ${prev + next}');
    
    return prev + next;
  }); // final result = numbers.reduce((prev, next) => prev + next);
  
  print(result);
  
  List<String> words = [
    '안녕',
    '나는',
    '이기용입니다'
  ];
  
  final sentence = words.reduce((prev, next) => prev + next);
  
  print(sentence);
  
//   words.reduce((prev, next)=> prev.length + next.length);
// 리턴하는 값이 List에 타입과 똑같지가 않다 
}
```

### fold

```dart
List<int> numbers = [
    1,
    3,
    5,
    7,
    9
  ];  
  
  List<String> words = [
    '안녕',
    '나는',
    '이기용입니다'
  ];
  
  final sentence = words.fold<String>('', (prev, next) => prev + next);
  
  print(sentence);
  
  final count = words.fold<int>(0, (prev, next) => prev + next.length);
  
  print(count);
  
//   words.reduce((prev, next)=> prev.length + next.length);
  
   final sum = numbers.fold<int>(0, (prev, next) => prev + next);
    print(sum);
  
```

### ...(cascading operator)

```dart
void main() {
  List<int> even = [
    2,
    4,
    6,
    8,
  ];
  
  List<int> odd = [
    1,3,5,7,9
  ];
  
  
  print([...even, ...odd]);
  print(even);
  print([...even]);
  print(even == [...even]);
}
// 결과값
[2, 4, 6, 8, 1, 3, 5, 7, 9]
[2, 4, 6, 8]
[2, 4, 6, 8]
false

```

````dart
void main() {
  List<Map<String, String>> people = [
    {'name': '로제', 'group': '블랙핑크'},
    {'name': '지수', 'group': '블랙핑크'},
    {'name': 'RM', 'group': 'BTS'},
    {'name': '뷔', 'group': 'BTS'},
  ];
  print(people);
  final parsedPeople = people
      .map((x) => Person(
            name: x['name']!,
            group: x['group']!,
          ))
      .toList();

  print(parsedPeople);

  for (Person person in parsedPeople) {
    print(person.name);
    print(person.group);
  }
  ;

  final bts = parsedPeople.where(
    (x) => x.group == 'BTS',
  );
  print(bts.toList());

  final result = people
      .map((x) => Person(
            name: x['name']!,
            group: x['group']!,
          ))
      .where((x) => x.group == 'BTS')
      .fold<int>(0, (prev, next) => prev + next.name.length);

  print(result);
}

class Person {
  final String name;
  final String group;

  Person({required this.name, required this.group});

  @override
  String toString() {
    return 'Person(name:$name, group:$group)';
  }
}
````

## Async Programming 비동기 프로그래밍

- 서버요청을 하는데 필요함
- CPU의 낭비를 막아준다  

### Future



```dart
void main() {
  // Future - 미래
  // 미래에 받아올 값
  Future<String> name = Future.value('이기용');
  Future<int> number = Future.value(1);
  Future<bool> isTure = Future.value(true);
  
  print('함수 시작');
  // 2개의 파라미터
  // delayed - 지연되다
  // 1번 파라미터 - 지연할 기간(얼마나 지연할건지) Duration
  // 2번 파라미터 - 지연 시간이 지난 후 실행할 함수.
  Future.delayed(Duration(seconds:2), (){
    print('Delay 끝');
  });
  
  addNumbers(1,1);
  addNumbers(2,2);
}


void addNumbers(int number1, int number2) {
  print('계산중: $number1 + $number2');
  
  // print('계산완료: ${number1 + number2}');
  // 서버 시뮬레이션
  Future.delayed(Duration(seconds:2), (){
    print('계산완료: ${number1 + number2}');
  });
  
  print('함수 완료');
}
```

#### async

- 함수의 파라미터 와 식 사이에 작성한다.
- 그래야 await 를 사용할 수 있음

#### await 

- 이 코드가 실행하기 전에 다른코드를 실행시키지 못하게 한다.

```dart
void main() async {
  // Future - 미래
  // 미래에 받아올 값
  Future<String> name = Future.value('이기용');
  Future<int> number = Future.value(1);
  Future<bool> isTure = Future.value(true);

  await addNumbers(1, 1);
  await addNumbers(2, 2);
}
// 이 함수도 Future를 붙이면 가능
Future<void> addNumbers(int number1, int number2) async {
  print('계산중: $number1 + $number2');

  // print('계산완료: ${number1 + number2}');
  // 서버 시뮬레이션
  await Future.delayed(Duration(seconds: 2), () {
    print('계산완료: ${number1 + number2}');
  });

  print('함수 완료: $number1 + $number2');
}

```

### **Stream** (많이 사용)

- 완료가 될때까지 무한하게 데이터를 받을 수 있다.
- 지속적으로 값을 받을 수 있다.
- 하지만 조금 복잡하다.

```dart
import 'dart:async';


void main() {
  final controller = StreamController();
  //asBroadcastStream 여러번 listen하려면 저걸 붙여주면된다
  final stream = controller.stream.asBroadcastStream();
  
  
  final streamListener1 = stream.where((val) => val % 2 == 0).listen((val){
    print('Listener 1: $val');
  });
  final streamListener2 = stream.where((val) => val % 2 == 1).listen((val){
    print('Listener 2: $val');
  });
  
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(5);
  
}
```

- 함수로 

```dart
import 'dart:async';


void main() {
//   calculate(2).listen((val) {
//     print('calculate(2) : $val');
//   });
  
//   calculate(4).listen((val) {
//     print('calculate(4) : $val');
//   });
  playAllStream().listen((val){
    print(val);
  });
}

Stream<int> playAllStream()async* {
  // 만약에 calculate2가 끝나고 4가 실행되려면 어떻게 해야될려나? Stream을 await 하는 방법
  yield* calculate(1); // 해당되는 모든 값을 다 가져올때까지 기다린다
  yield* calculate(1000);
}

Stream<int> calculate(int number) async* {
  for (int i= 0; i <5; i++){
    yield i* number;
    
    await Future.delayed(Duration(seconds : 1));
  }
}
```

