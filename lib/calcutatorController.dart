
// ignore_for_file: unnecessary_this, file_names

import 'package:get/get.dart';

class CalculatorController extends GetxController{
  
  var result=0.obs;



  void increment(var num1, var num2){
  
    result.value=num1+num2;
    
  
  }

  void decrease(var num1, var num2){

    result.value = num1-num2;
  }

  void multiply(var num1, var num2){
    result.value = num1*num2;
  }

  void divide(var num1, var num2){
   var convert = num1/num2;
   result.value=convert.toInt();

   // result.value=(num1/num2);

  }



}