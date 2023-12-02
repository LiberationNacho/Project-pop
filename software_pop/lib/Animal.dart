import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Animal {
  String petStatus = ''; // 동물 상태를 저장하는 변수

  void displayInfo() {
    petStatus = 'Animal info';
    print(petStatus);
  }

  void eat() {
    petStatus = 'Animal is eating';
    print(petStatus);
  }

  void sleep() {
    petStatus = 'Animal is sleeping';
    print(petStatus);
  }

  void play() {
    petStatus = 'Animal is playing';
    print(petStatus);
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
  String currentImage = 'images/popcat.jpg';

  // 동물과 상호 작용하는 메서드
  void _interactWithPet() {
    setState(() {
      myPet.displayInfo();
    });
  }

  // 동물에게 먹이 주기
  void _feedPet() {
    setState(() {
      myPet.eat();
    });
  }

  // 동물을 재우기
  void _putPetToSleep() {
    setState(() {
      myPet.sleep();
    });
  }

  // 동물과 놀기
  void _playWithPet() {
    setState(() {
      myPet.play();
    });
  }

  // 이미지 변경 메서드
  void _changeImage() {
    setState(() {
      currentImage = (currentImage == 'images/popcat.jpg')
          ? 'images/popcat2.jpg'
          : 'images/popcat.jpg';
    });
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
            SizedBox(height: 20), // 버튼 위 간격
            // GestureDetector를 사용하여 이미지 클릭 감지
            GestureDetector(
              onTap: _changeImage,
              child: Image.asset(
                currentImage,
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 20), // 이미지와 버튼 간 간격
            ElevatedButton(
              onPressed: _interactWithPet,
              child: const Text('상호작용'),
            ),
            SizedBox(height: 10), // 버튼 간격 조절
            ElevatedButton(
              onPressed: _feedPet,
              child: const Text('먹이 주기'),
            ),
            SizedBox(height: 10), // 버튼 간격 조절
            ElevatedButton(
              onPressed: _putPetToSleep,
              child: const Text('재우기'),
            ),
            SizedBox(height: 10), // 버튼 간격 조절
            ElevatedButton(
              onPressed: _playWithPet,
              child: const Text('놀아주기'),
            ),
            SizedBox(height: 20), // 버튼 아래 간격
            // 추가: 동물 상태를 표시하는 Text 위젯
            Text(myPet.petStatus),
          ],
        ),
      ),
    );
  }
}
