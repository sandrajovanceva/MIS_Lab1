import 'package:flutter/cupertino.dart';

class Exam {
  String name;
  DateTime dateTime;
  List<String> rooms;

  Exam ({
    required this.name,
    required this.dateTime,
    required this.rooms
  });

  static final List<Exam> exams = [
    Exam(name: "Мобилни информациски системи", dateTime: DateTime(2025, 11, 17, 10, 00), rooms: ["200аб", "200в"]),
    Exam(name: "Менаџмент информациски системи", dateTime: DateTime(2025, 11, 18, 16, 00), rooms: ["138", "13"]),
    Exam(name: "Мобилни платформи и програмирање", dateTime: DateTime(2025, 11, 07, 14, 30), rooms: ["3", "2"]),
    Exam(name: "Структурно програмирање", dateTime: DateTime(2025, 11, 15, 08, 00), rooms: ["117", "138"]),
    Exam(name: "Вовед во наука на податоците", dateTime: DateTime(2025, 11, 19, 12, 00), rooms: ["2", "117"]),
    Exam(name: "Веројатност", dateTime: DateTime(2025, 11, 08, 12, 00), rooms: ["138", "АМФ"]),
    Exam(name: "Веб програмирање", dateTime: DateTime(2025, 11, 20, 10, 00), rooms: ["215", "200аб"]),
    Exam(name: "Вовед во компјутерски науки", dateTime: DateTime(2025, 11, 18, 13, 00), rooms: ["138", "13"]),
    Exam(name: "Бази на податоци", dateTime: DateTime(2025, 11, 21, 08, 00), rooms: ["200аб", "117"]),
    Exam(name: "Оперативни системи", dateTime: DateTime(2025, 11, 19, 17, 00), rooms: ["117", "3"]),
  ];
}