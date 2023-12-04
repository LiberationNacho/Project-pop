import 'package:flutter/material.dart';

class Inventory {
  int _storeName = 0; // 0 = 옷, 1 = 가구, 2 = 음악 상점
  int _selectItem = 0; // 다양한 아이템 중 어떤 아이템을 선택했는지 체크하는 변수

  void chooseStoreName(int num) {
    _storeName = num;
  }

  void chooseItem(int num) {
    _selectItem = num;
  }
}

class InventoryUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Inventory UI'),
        ),
        body: InventoryGrid(),
      ),
    );
  }
}

class InventoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 열의 개수
      ),
      itemBuilder: (BuildContext context, int index) {
        // 여기서 각 버튼을 만들어서 반환
        return InventoryButton(index);
      },
      itemCount: 15, // 총 버튼의 개수 (3x5)
    );
  }
}

class InventoryButton extends StatelessWidget {
  final int index;

  InventoryButton(this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 버튼이 눌렸을 때 실행되는 코드
        print('Button $index pressed.');
        // 여기서 필요한 로직을 추가하세요.
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        color: Colors.blue, // 버튼 색상
        child: Center(
          child: Text(
            'Item $index',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(InventoryUI());
}
