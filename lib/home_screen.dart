import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'store_screen.dart';
import 'inventory_screen.dart';
import 'diary_screen.dart';
import 'cat.dart';
import 'checklist_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 2; // 처음에 앱이 실행되었을 때 가장 먼저 보여질 화면을 _screens 중 어떤 것으로 할 것인가?

  // 하단 바 구성
  final List<Widget> _screens = [
    StoreScreen(), // 0
    InventoryScreen(), // 1
    Cat(), // 2
    CheckListScreen(), // 3
    DiaryScreen(), // 4
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // 하단 바를 누를 때 마다 _currentIndex의 값이 변하면서 화면이 전환됨
          });
        },
        backgroundColor: Colors.yellow, // 바텀 네비게이션 바의 배경색
        type: BottomNavigationBarType.fixed, // 아이템이 고정되도록 설정
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.shopping_cart,
              size: 30,
              color: Colors.white, // 아이콘의 색상
            ),
            label: '상점',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.cube_box_fill,
              size: 30,
              color: Colors.white, // 아이콘의 색상
            ),
            label: '가방',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              size: 30,
              color: Colors.white, // 아이콘의 색상
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.cube_box_fill,
              size: 30,
              color: Colors.white, // 아이콘의 색상
            ),
            label: '체크리스트',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.book_fill,
              size: 30,
              color: Colors.white, // 아이콘의 색상
            ),
            label: '일기',
          ),
        ],
      ),
    );
  }
}
