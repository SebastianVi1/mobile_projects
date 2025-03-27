import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/task_model.dart';
import 'package:to_do/task_viewmodel.dart';

class WAddTaskButton extends StatefulWidget {
  const WAddTaskButton({super.key});

  @override
  State<WAddTaskButton> createState() => _WAddTaskButtonState();
}

class _WAddTaskButtonState extends State<WAddTaskButton> {
  TextEditingController _nameController = TextEditingController();
  
  @override 
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TaskViewModel>(context);
    

    return Container(
      alignment: Alignment.bottomRight,
      child: Padding(
        
        padding: const EdgeInsets.only(right: 8.0, top: 10),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.blue[700],
          foregroundColor: Colors.white,
          
          onPressed: (){
            showModalBottomSheet(
              context: context, 
              builder: (BuildContext context){
                return SizedBox(
                  height: 200,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                              hintText: 'Write a task',
                            ),
                          ),
                          
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                            foregroundColor: WidgetStatePropertyAll(Colors.white),
                          ),
                          onPressed: (){
                            if (_nameController.text.isEmpty){
                              return;
                            }
                            provider.addTask(Task(_nameController.text, 'no-description'));
                            _nameController.clear();
                          }, 
                          child: Text('Save Task'))
                      ],
                    ),
                  ),
                );
              });
          },
          label: Text('NewTask   +')),
          
      ),
    );
  }
}

