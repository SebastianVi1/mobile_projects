import 'dart:ffi';

class CalculatorModel {
  double? firstNum;
  double? secondNum;
  String result = '';
  String textToDisplay = '';
  String operation = '';

  void clear() {
    firstNum = null;
    secondNum = null;
    textToDisplay = "";
    operation = "";
  }
}