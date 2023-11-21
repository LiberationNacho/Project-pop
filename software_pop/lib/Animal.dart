import 'package:flutter/material.dart';

class Animal {
  String _name = "";
  int _hunger = 0; // 허기진 정도를 나타내는 변수

  void setName(String n) {
    this._name = n;
  }

  String getName() {
    return this._name;
  }

  bool isHungry() {
    return this._hunger < 20;
  }

  void eat() {
    if (isHungry()) {
      _hunger = 0;
      print("$_name is eating. Hunger level: $_hunger");
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
    print("Name: $_name, Hunger: $_hunger");
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