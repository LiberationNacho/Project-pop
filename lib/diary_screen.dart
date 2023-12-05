import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryScreen extends StatefulWidget {
  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  bool checkBoxValue = false;
  bool checkBox2Value = false;
  bool checkBox3Value = false;
  bool checkBox4Value = false;
  int totalAmount = 0;
  String today = "";

  @override
  void initState() {
    super.initState();
    getDate();
  }

  void getDate(){
    DateTime now = DateTime.now();
    today = DateFormat('yyyy년 MM월 dd일').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold로 감싸기
      appBar: AppBar(
        title: Text(
            today,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Checkbox(
                  value: checkBoxValue,
                  onChanged: (bool? value) {
                    setState(() {
                      checkBoxValue = value!;
                    });
                  },
                ),
                Text('일기쓰기 100 Rs'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: checkBox2Value,
                  onChanged: (bool? value) {
                    setState(() {
                      checkBox2Value = value!;
                    });
                  },
                ),
                Text('산책하기 100 Rs'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: checkBox3Value,
                  onChanged: (bool? value) {
                    setState(() {
                      checkBox3Value = value!;
                    });
                  },
                ),
                Text('고양이 밥주기 100 Rs'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: checkBox4Value,
                  onChanged: (bool? value) {
                    setState(() {
                      checkBox4Value = value!;
                    });
                  },
                ),
                Text('밥 챙겨먹기 100 Rs'),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                calculateTotalAmount();
              },
              child: Text('Calculate Total'),
            ),
            Text('Your Selected items are:'),
            Text('Total Price is: $totalAmount Rs'),
          ],
        ),
      ),
    );
  }

  void calculateTotalAmount() {
    totalAmount = 0;
    if (checkBoxValue) {
      totalAmount += 500;
    }
    if (checkBox2Value) {
      totalAmount += 500;
    }
    if (checkBox3Value) {
      totalAmount += 300;
    }
    if (checkBox4Value) {
      totalAmount += 100;
    }
    setState(() {});
  }
}
