import 'package:calculator/view/calculator_screen.dart';
import 'package:calculator/viewModel/calculator_view_model.dart';
import 'package:calculator/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => CalculatorViewModel() ,
      child: MaterialApp(
        
        darkTheme: Themes.darkTheme,
        theme: Themes.lightMode,
        debugShowCheckedModeBanner: false,
        home: CalculatorScreen(),
        themeMode: ThemeMode.light,
      ),


    );  
  }
}