import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryScreen extends StatefulWidget {
  @override
  _DiaryScreen createState() => _DiaryScreen();
}

class _DiaryScreen extends State<DiaryScreen> {
  TextEditingController _dayDiaryController = TextEditingController();
  TextEditingController _feelingDiaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "일기장",
        ),
        backgroundColor: Colors.yellow,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Upper part for writing about the day
            Expanded(
              child: TextField(
                controller: _dayDiaryController,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: '오늘의 일기를 작성하세요...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Lower part for describing feelings
            Expanded(
              child: TextField(
                controller: _feelingDiaryController,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: '오늘의 감사를 작성하세요...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                saveDiary(); // 여기에서 일기 저장 등 추가적인 로직을 수행할 수 있습니다.
              },
              child: Text('저장'),
            ),
          ],
        ),
      ),
    );
  }

  void saveDiary() {
    String dayDiaryText = _dayDiaryController.text;
    String feelingDiaryText = _feelingDiaryController.text;

    // 여기에서 일기를 저장하거나 추가적인 작업을 수행할 수 있습니다.
    print('오늘의 일기 저장: $dayDiaryText');
    print('오늘의 기분 저장: $feelingDiaryText');

    // 저장 후 필요에 따라 사용자에게 알림을 주거나 다른 동작을 수행할 수 있습니다.
  }
}

void main() {
  runApp(MaterialApp(
    home: DiaryScreen(),
  ));
}
