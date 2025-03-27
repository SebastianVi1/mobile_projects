import 'package:calculator/model/calculator_model.dart';
import 'package:calculator/viewModel/calculator_view_model.dart';
import 'package:calculator/widgets/clear_input.dart';
import 'package:calculator/widgets/number_button.dart';
import 'package:calculator/widgets/plus.dart';
import 'package:calculator/widgets/result_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({super.key});
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}
class _CalculatorScreenState extends State<CalculatorScreen> {

  TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    var modelCalc = Provider.of<CalculatorViewModel>(context);
    return Scaffold(

      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment(0.8, 1),
                    child: Text(
                      modelCalc.getActualNumber(),
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                ),
              ),
              Divider(thickness: 2,height: 40,),
              Flexible(
                flex: 3,
                child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClearButton(text: 'C'),
                          NumberButton(text: '( )'),
                          NumberButton(text: '%'),
                          NumberButton(text: '/'),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NumberButton(text: '7'),
                          NumberButton(text: '8'),
                          NumberButton(text: '9'),
                          NumberButton(text: 'X'),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NumberButton(text: '4'),
                          NumberButton(text: '5'),
                          NumberButton(text: '6'),
                          NumberButton(text: '-'),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NumberButton(text: '1'),
                          NumberButton(text: '2'),
                          NumberButton(text: '3'),
                          PlusButton(text: '+'),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NumberButton(text: '-'),
                          NumberButton(text: '0'),
                          NumberButton(text: '.'),
                          ResultButton(text: '='),
                        ],
                      ),
                    ],
                  ),
              ),


            ],
          ),

        ),
      ),
    );
  }
}