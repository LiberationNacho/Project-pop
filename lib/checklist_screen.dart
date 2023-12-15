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
  // 우울한 기분을 이겨내기 위해 제시되는 항목 들 중 일부를 List로 저장
  // To-Do 리스트 항목으로 사용됨
  List<ChecklistItem> checklistItems = [
    ChecklistItem('감정일기 작성', 200),
    ChecklistItem('엄마랑 전화', 200),
    ChecklistItem('20분 이상 산책', 100),
    ChecklistItem('건강한 식사', 200),
    ChecklistItem('8시간 이상 수면', 200)
  ];

  // 막연한 우울감이 아니라 구체적으로 어떤 부분이 안좋은지 확인 할 수 있는 지표
  // 단순하게 체크 해보며 확인할 수 있도록 사용됨
  List<ChecklistItem> emotion = [
    ChecklistItem('이유 없는 기분 저하', 0),
    ChecklistItem('식욕 감퇴', 0),
    ChecklistItem('삶에 대한 흥미 감소', 0),
    ChecklistItem('이유없는 불안', 0),
    ChecklistItem('집중력 저하', 0),
    ChecklistItem('수면 장애', 0),
    ChecklistItem('스르로에 대한 죄책감', 0)
  ];

  List<bool> checkBoxValues = List.filled(5, false); // To-do 리스트 중 어떤 항목이 완료 표시가 되었는지 알 수 있음
  List<bool> emotionCheckBoxValues = List.filled(7, false); // 감정 항목들 중 어떤게 체크 표시 되었는지 저장되는 리스트
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
          Column( // 제시되는 To-do 리스트 항목들이 나열되어있는 컬럼
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
          Column( // 기분을 알 수 있는 체크 박스가 들어있는 컬럼
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

  // 현재까지 체크한 To-do 리스트를 기반으로 익일에 포인트가 얼마나 들어올지 미리 확인할 수 있음
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
