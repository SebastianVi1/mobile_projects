import 'dart:ffi';

import 'package:calculator/model/calculator_model.dart';
import 'package:calculator/viewModel/calculator_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlusButton extends StatelessWidget {
  PlusButton({super.key, required this.text});
  final String text;
  CalculatorModel calcModel = CalculatorModel();


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CalculatorViewModel>(context);
    return SizedBox(
      width: 70,
      height: 70,
      
    child: FilledButton(
      
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )
        )
      ),
      onPressed: (){
        provider.operato
        var actualText = provider.getActualNumber();
         if (actualText.isNotEmpty){
          calcModel.firstNum = double.tryParse(actualText);
          print(calcModel.firstNum);
          provider.clearNumberInput();
         }
         
          
      }
        
      , 
      child: Text(
        text,
        style: TextStyle(
          fontSize: 22,

        ),
      ),
      ),
    );
  }
}