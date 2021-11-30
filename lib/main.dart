// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_calculator/calcutatorController.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  CalculatorController calculatorController = Get.put(CalculatorController());
  final TextEditingController _t1 = TextEditingController();
  final TextEditingController _t2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 150, 8, 0),
          child: Column(
            children: [
              Column(
                children: [
                  // Text("İlk sayı"),
                  textField(_t1, "İlk sayıyı giriniz"),
                ],
              ),
              sizedBox20(),
              Column(
                children: [
                  // Text("İkinci sayı"),
                  textField(_t2, "İkinci sayıyı giriniz")
                ],
              ),
              sizedBox20(),
              buttonsRow(),
              sizedBox20(),
              resultText(),
            ],
          ),
        ),
      ),
    );
  }

  TextField textField(controller, hintText) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
      ),
    );
  }

  Obx resultText() {
    return Obx(
      () => Text(
        "Sonuç: ${calculatorController.result.toString()}",
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  Row buttonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
            onPressed: () {
              calculatorController.increment(
                  num.parse(_t1.text), num.parse(_t2.text));
            },
            child: Text("+")),
        ElevatedButton(
            onPressed: () {
              calculatorController.decrease(
                  num.parse(_t1.text), num.parse(_t2.text));
            },
            child: Text("-")),
        ElevatedButton(
            onPressed: () {
              calculatorController.multiply(
                  num.parse(_t1.text), num.parse(_t2.text));
            },
            child: Text("*")),
        ElevatedButton(
            onPressed: () {
              calculatorController.divide(
                  num.parse(_t1.text), num.parse(_t2.text));
            },
            child: Text("/")),
      ],
    );
  }

  SizedBox sizedBox20() {
    return SizedBox(
      height: 20,
    );
  }
}
