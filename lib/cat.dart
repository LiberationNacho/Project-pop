import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/svg.dart';

enum CatState {
  Awake,
  Sleeping,
}

class Animal {
  String petStatus = ''; // 동물 상태를 저장하는 변수
  int hungry = 100; // 공복지수
  int affection = 0; // 친밀도
  CatState catState = CatState.Awake;

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

class Cat extends StatefulWidget {
  const Cat({Key? key}) : super(key: key);

  @override
  _Cat createState() => _Cat();
}

class _Cat extends State<Cat> {
  Animal myPet = Animal();
  String currentImage = 'images/popcat.jpg';
  Timer? hungerTimer;
  int interactionCount = 0;

  @override
  void initState() {
    super.initState();

    // 1분마다 공복지수를 1씩 감소시키는 타이머 설정
    hungerTimer = Timer.periodic(Duration(minutes: 1), (Timer timer) {
      setState(() {
        myPet.hungry -= 1;
        if (myPet.hungry < 0) {
          myPet.hungry = 0;
        }
      });
    });

    // 밤 10시부터 아침 6시까지 자는 상태로 전환
    Timer.periodic(Duration(minutes: 1), (Timer timer) {
      var now = DateTime.now();
      if (now.hour >= 22 || now.hour < 6) {
        setState(() {
          myPet.catState = CatState.Sleeping;
        });
      } else {
        setState(() {
          myPet.catState = CatState.Awake;
        });
      }
    });
  }

  @override
  void dispose() {
    hungerTimer?.cancel(); // 페이지가 dispose될 때 타이머 해제
    super.dispose();
  }

  // 동물과 상호 작용하는 메서드
  void _interactWithPet() {
    setState(() {
      myPet.displayInfo();
      _increaseAffection(1);
    });
  }

  // 동물에게 먹이 주기
  void _feedPet() {
    setState(() {
      myPet.eat();
      myPet.hungry += 10;
      if (myPet.hungry > 100) {
        myPet.hungry = 100;
      }
      _increaseAffection(1);
    });
  }

  // 동물과 놀기
  void _playWithPet() {
    setState(() {
      myPet.play();
      _increaseAffection(1);
    });
  }

  // 이미지 변경 메서드
  void _changeImage() {
    setState(() {
      currentImage = (currentImage == 'images/popcat.jpg')
          ? 'images/popcat2.jpg'
          : 'images/popcat.jpg';
    });
    _increaseAffection(1);
  }

  // 친밀도 증가 메서드, 버튼 클릭의 합이 50이상이면 친밀도 1증가
  void _increaseAffection(int value) {
    interactionCount += value;
    if (interactionCount >= 50) {
      myPet.affection += 1;
      interactionCount = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("야옹"),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Click the buttons to interact with your pet:',
            ),
            SizedBox(height: 10), // 버튼 위 간격
            // 추가: 동물 상태와 공복지수, 친밀도를 표시하는 Text 위젯
            Text(myPet.petStatus),
            Text('Hungry: ${myPet.hungry}'),
            Text('Affection: ${myPet.affection}'),
            Text('Cat State: ${myPet.catState}'),
            SizedBox(height: 20), // 이미지와 버튼 간 간격
            // GestureDetector를 사용하여 이미지 클릭 감지
            GestureDetector(
              onTap: _changeImage,
              child: SvgPicture.asset(
                'assets/cat_motions/cat1.svg', // 실제 SVG 파일의 경로
                width: 100,
              )
            ),
            SizedBox(height: 20), // 이미지와 버튼 간 간격
            // 밤 10시부터 아침 6시까지 잠자기 상태인 경우 "동물 잠잠" 메시지 표시
            if (myPet.catState == CatState.Sleeping)
              Text(
                '동물 잠잠',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            // 가로로 정렬된 버튼들
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _interactWithPet,
                  child: const Text('상호작용'),
                ),
                SizedBox(width: 10), // 버튼 간격 조절
                ElevatedButton(
                  onPressed: _feedPet,
                  child: const Text('먹이 주기'),
                ),
                SizedBox(width: 10), // 버튼 간격 조절
                ElevatedButton(
                  onPressed: _playWithPet,
                  child: const Text('놀아주기'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
