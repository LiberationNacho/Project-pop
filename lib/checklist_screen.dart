import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChecklistItem {
  final String title;
  final int price;

  ChecklistItem(this.title, this.price);
}

class CheckListScreen extends StatefulWidget {
  @override
  _CheckListScreenState createState() => _CheckListScreenState();
}

class _CheckListScreenState extends State<CheckListScreen> {
  List<ChecklistItem> checklistItems = [
    ChecklistItem('감정일기 작성', 200),
    ChecklistItem('엄마랑 전화', 200),
    ChecklistItem('20분 이상 산책', 100),
    ChecklistItem('건강한 식사', 200),
    ChecklistItem('8시간 이상 수면', 200)
  ];

  List<ChecklistItem> emotion = [
    ChecklistItem('이유 없는 기분 저하', 0),
    ChecklistItem('식욕 감퇴', 0),
    ChecklistItem('삶에 대한 흥미 감소', 0),
    ChecklistItem('이유없는 불안', 0),
    ChecklistItem('집중력 저하', 0),
    ChecklistItem('수면 장애', 0),
    ChecklistItem('스르로에 대한 죄책감', 0)
  ];

  List<bool> checkBoxValues = List.filled(5, false);
  List<bool> emotionCheckBoxValues = List.filled(7, false);
  int totalAmount = 0;
  String today = "";

  @override
  void initState() {
    super.initState();
    getDate();
  }

  void getDate() {
    DateTime now = DateTime.now();
    today = DateFormat('yyyy년 MM월 dd일').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          today,
        ),
        backgroundColor: Colors.yellow,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("To-Do List", style: TextStyle(fontSize: 25), ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < checklistItems.length; i++)
                Row(
                  children: [
                    Checkbox(
                      value: checkBoxValues[i],
                      onChanged: (bool? value) {
                        setState(() {
                          checkBoxValues[i] = value!;
                        });
                      },
                    ),
                    Text(checklistItems[i].title),
                  ],
                ),
              ElevatedButton(
                onPressed: () {
                  calculateTotalAmount();
                },
                child: Text('예상 보상'),
              ),
              Text('지급 예정 코인: $totalAmount 코인'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider( // Horizontal line between the two sections
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("오늘 기분은 어땠나요?", style: TextStyle(fontSize: 25), ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < emotion.length; i++)
                Row(
                  children: [
                    Checkbox(
                      value: emotionCheckBoxValues[i],
                      onChanged: (bool? value) {
                        setState(() {
                          emotionCheckBoxValues[i] = value!;
                        });
                      },
                    ),
                    Text(emotion[i].title),
                  ],
                ),
              ElevatedButton(
                onPressed: () {
                },
                child: Text('오늘 기분 저장'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void calculateTotalAmount() {
    totalAmount = 0;
    for (int i = 0; i < checklistItems.length; i++) {
      if (checkBoxValues[i]) {
        totalAmount += checklistItems[i].price;
      }
    }
    setState(() {});
  }
}
