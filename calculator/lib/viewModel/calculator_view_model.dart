import 'package:calculator/model/calculator_model.dart';
import 'package:flutter/material.dart';

class CalculatorViewModel extends ChangeNotifier{
  var calcModel = CalculatorModel();
  String get operator => calcModel.operation;
  double get firstNum {return calcModel.firstNum ?? 0.0;}
  double get secondNum {return calcModel.secondNum ?? 0.0;}

  
  void changeScreenNumber(String text){
    calcModel.textToDisplay += text;
    notifyListeners();
  }

  String getActualNumber(){
    return calcModel.textToDisplay;
  }
  
  void deleteLastNumber(){
    var text = calcModel.textToDisplay;
    if (text.isNotEmpty){
      var newText = text.substring(0, text.length - 1);  
      text = newText;
    }
    
  }

  void clearNumberInput(){
    calcModel.clear();
    notifyListeners();
  }


  void calculateResult() {
    if (calcModel.firstNum != null && calcModel.textToDisplay.isNotEmpty) {
      calcModel.secondNum = double.tryParse(calcModel.textToDisplay);

      if (calcModel.secondNum != null) {
        switch (calcModel.operation) {
          case "+":
            calcModel.result = (calcModel.firstNum! + calcModel.secondNum!).toString();
            print(calcModel.result);
            break;
          case "-":
            calcModel.textToDisplay = (calcModel.firstNum! - calcModel.secondNum!).toString();
            break;
          case "*":
            calcModel.textToDisplay = (calcModel.firstNum! * calcModel.secondNum!).toString();
            break;
          case "/":
            if (calcModel.secondNum! != 0) {
              calcModel.textToDisplay = (calcModel.firstNum! / calcModel.secondNum!).toString();
            } else {
              calcModel.textToDisplay = "Error"; // Evitar división por cero
            }
            break;
        }
        calcModel.firstNum = null; // Reiniciar el cálculo
        calcModel.secondNum = null;
        calcModel.operation = "";
        notifyListeners();
      }
    }
  }
}