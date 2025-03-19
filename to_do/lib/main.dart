import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/task_view.dart';
import 'package:to_do/task_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      
      create: (context) => TaskViewModel(),
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        home: ListScreen(),
      ),
    );
  }
}