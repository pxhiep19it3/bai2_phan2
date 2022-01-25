import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final myInput = TextEditingController();

  String result = 'Kết quả hiển thị ở đây!';
  void check() {
    setState(() {
      var number;
      number = int.parse(myInput.text);

      if (number < 2) {
        result = 'Số $number không là số nguyên tố';
      }
      int count = 0;
      for (int i = 2; i <= sqrt(number); i++) {
        if (number % i == 0) {
          count++;
        }
      }
      if (count == 0) {
        result = 'Số $number là số nguyên tố';
      } else {
        result = 'Số $number không là số nguyên tố';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "$result",
                  style: TextStyle(color: Colors.red, fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: TextField(
                  controller: myInput,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nhập số cần kiểm tra",
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  check();
                },
                child: Text("Kiểm tra"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
