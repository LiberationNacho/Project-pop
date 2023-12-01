import 'package:flutter/material.dart';
/*

class Animal {
  String _name = "";
  int _fulless = 0; // 포만감을 나타내는 변수

  void setName(String n) {
    this._name = n;
  }

  String getName() {
    return this._name;
  }

  bool isHungry() {
    return this._fulless < 20;
  }

  void eat() {
    if (isHungry()) {
      _hunger = 0;
      print("$_name is eating. Hunger level: $_fulless");
    } else {
      print("$_name is not hungry.");
    }
  }

  void sleep() {
    print("$_name is sleeping.");
  }

  void play() {
    print("$_name is playing.");
  }

  void displayInfo() {
    print("Name: $_name, Hunger: $_fulless");
  }
}

class AnimalUI {
  late Animal _ani;

  // 생성자
  AnimalUI(Animal animal) {
    _setAni(animal);
  }

  // _ani에 접근하기 위한 게터
  Animal get animal => _ani;

  // _ani를 설정하기 위한 세터
  void _setAni(Animal a) {
    _ani = a;
  }

  void displayAniInfo() {
    _ani.displayInfo();
  }

  // 동물과 상호 작용하는 메서드
  void interactWithAni() {
    _ani.displayInfo();
    if (_ani.isHungry()) {
      print("${_ani.getName()} is hungry. You can feed it!");
    } else {
      print("${_ani.getName()} is not hungry. You can play with it!");
    }
  }
}

/*
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'give me rice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '아 진짜 우째 살아야 하지?'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/
*/

void main() {
  runApp(const MyApp());
}

// 동물을 나타내는 클래스
class Animal {
  String _name = "PopCat";
  int _fullless = 0;

  // 동물의 이름을 설정하는 메서드
  void setName(String name) {
    _name = name;
  }

  // 동물이 먹는 메서드
  void eat() {
    _fullless = 100;
    print("$_name is eating. Hunger level: $_fullless");
  }

  // 동물이 자는 메서드
  void sleep() {
    print("$_name is sleeping.");
  }

  // 동물이 놀기 메서드
  void play() {
    print("$_name is playing.");
  }

  // 동물의 정보를 출력하는 메서드
  void displayInfo() {
    print("Name: $_name, Hunger: $_fullless");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Simulator',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Pet Simulator Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Animal myPet = Animal();

  // 동물과 상호 작용하는 메서드
  void _interactWithPet() {
    myPet.displayInfo();
  }

  // 동물에게 먹이 주기
  void _feedPet() {
    myPet.eat();
    myPet.displayInfo();
  }

  // 동물을 재우기
  void _putPetToSleep() {
    myPet.sleep();
    myPet.displayInfo();
  }

  // 동물과 놀기
  void _playWithPet() {
    myPet.play();
    myPet.displayInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Click the buttons to interact with your pet:',
            ),
            ElevatedButton(
              onPressed: _interactWithPet,
              child: const Text('상호작용'),
            ),
            ElevatedButton(
              onPressed: _feedPet,
              child: const Text('먹이 주기'),
            ),
            ElevatedButton(
              onPressed: _putPetToSleep,
              child: const Text('재우기'),
            ),
            ElevatedButton(
              onPressed: _playWithPet,
              child: const Text('놀아주기'),
            ),
          ],
        ),
      ),
    );
  }
}