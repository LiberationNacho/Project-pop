import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Store {
  int _storeName = 0; // 0 = 옷, 1 = 가구, 2 = 음악 상점
  int _selectItem = 0; // 다양한 아이템 중 어떤 아이템을 선택했는지 체크하는 변수

  void chooseStoreName(int num) {
    _storeName = num;
  }

  void chooseItem(int num) {
    _selectItem = num;
  }

  int getStoreName()
  {
    return _storeName;
  }

  int getSelectItem()
  {
    return _selectItem;
  }
}

class StoreScreen extends StatelessWidget {
  final Store store = Store();

  StoreScreen({super.key}); // Store 객체를 멤버 변수로 선언

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3, // 카테고리 수 탭 수
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellow,
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
            title: Text('상점'),
            bottom: TabBar(
              tabs: [
                Tab(text: '옷'),
                Tab(text: '가구'),
                Tab(text: '음악 상점'),
              ],
              labelColor: Colors.black,
              onTap: (index) {
                // 탭이 클릭되었을 때 chooseStoreName 함수 호출
                store.chooseStoreName(index);
              },
            ),
          ),
          body: TabBarView(
            children: [
              StoreGrid(Colors.blue, store), // InventoryGrid에 Inventory 객체 전달
              StoreGrid(Colors.green, store),
              StoreGrid(Colors.orange, store),
            ],
          ),
        ),
      ),
    );
  }
}

// 상품 진열장 구성을 어떻게 할지 정하는 클래스
// itemCount와 crossAxisCount를 이용해서 진열할 상품 수 조절 가능
class StoreGrid extends StatelessWidget {
  final Color buttonColor;
  final Store store; // Store 객체를 전달받도록 수정

  StoreGrid(this.buttonColor, this.store);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, //가로로 몇개를 둘 것인가?
      ),
      itemBuilder: (BuildContext context, int index) {
        return StoreButton(index, buttonColor, store); // InventoryButton에 Inventory 객체 전달
      },
      itemCount: 15,// 총 몇개의 상품을 진열할 것인가?
    );
  }
}

// 각 상품 자체가 버튼이됨
// 버튼의 이미지가 옷이나 가구, 음악 등이 되는 것
class StoreButton extends StatelessWidget {
  final int index;
  final Color buttonColor;
  final Store store; // Store 객체를 전달받도록 수정

  StoreButton(this.index, this.buttonColor, this.store);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 버튼이 눌렸을 때 실행되는 코드
        int storeCheck = store.getStoreName(); // inventory 객체 사용
        switch(storeCheck)
            {
          case 0:
            print("옷 탭의 $index 번 버튼을 누르셨습니다.");
            break;
          case 1:
            print("가구 탭의 $index 번 버튼을 누르셨습니다.");
            break;
          case 2:
            print("음악 탭의 $index 번 버튼을 누르셨습니다.");
            break;
          default:
        }
        // 여기서 필요한 로직을 추가하세요.
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        color: buttonColor,
        child: Center(
          child: Text(
            '상품 $index',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
